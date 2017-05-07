package com.javachina.controller;

import com.blade.ioc.annotation.Inject;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.*;
import com.blade.mvc.annotation.*;
import com.blade.mvc.http.HttpMethod;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.multipart.FileItem;
import com.blade.mvc.view.ModelAndView;
import com.blade.mvc.view.RestResponse;
import com.blade.patchca.DefaultPatchca;
import com.blade.patchca.Patchca;
import com.javachina.constants.Actions;
import com.javachina.constants.Constant;
import com.javachina.constants.EventType;
import com.javachina.dto.LoginUser;
import com.javachina.exception.TipException;
import com.javachina.ext.Access;
import com.javachina.kit.SessionKit;
import com.javachina.kit.Utils;
import com.javachina.model.*;
import com.javachina.service.*;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * 用户控制器
 */
@Controller
@Slf4j
public class MemberController extends BaseController {

    public static final String CLASSPATH = MemberController.class.getClassLoader().getResource("").getPath();

    public static final String upDir = CLASSPATH + "upload/";

    @Inject
    private OptionsService optionsService;

    @Inject
    private CodesService codesService;

    @Inject
    private UserService userService;

    @Inject
    private UserInfoService userInfoService;

    @Inject
    private CommentService commentService;

    @Inject
    private TopicService topicService;

    @Inject
    private UserlogService userlogService;

    @Inject
    private FavoriteService favoriteService;

    private Patchca patchca = new DefaultPatchca();

    /**
     * 通知列表
     */
    @Route(value = "/notices", method = HttpMethod.GET)
    public ModelAndView notices(Request request, Response response,
                                @QueryParam(defaultValue = "1", value = "page") Integer page,
                                @QueryParam(defaultValue = "15", value = "limit") Integer limit) {

        LoginUser user = SessionKit.getLoginUser();
        if (null == user) {
            response.go("/signin");
            return null;
        }

        return this.getView("notices");
    }

    /**
     * 修改新密码
     */
    @Route(value = "/reset_pwd", method = HttpMethod.POST)
    public ModelAndView reset_pwd(Request request, @QueryParam String code,
                                  @QueryParam String password,
                                  @QueryParam String re_password) {

        if (StringKit.isBlank(code) || StringKit.isBlank(password) || StringKit.isBlank(re_password)) {
            return null;
        }

        request.attribute("code", code);

        if (!password.equals(re_password)) {
            request.attribute(this.ERROR, "两次密码不一致，请确认后提交");
            return this.getView("reset_pwd");
        }

        if (password.length() > 20 || password.length() < 6) {
            request.attribute(this.ERROR, "请输入6-20位字符的密码");
            return this.getView("reset_pwd");
        }

        Codes codes = codesService.getActivecode(code);
        if (null == codes || !codes.getType().equals(EventType.FORGET)) {
            request.attribute(this.ERROR, "无效的激活码");
            return this.getView("reset_pwd");
        }

        Integer expries = codes.getExpired();
        if (expries < DateKit.getCurrentUnixTime()) {
            request.attribute(this.ERROR, "该激活码已经过期，请重新发送");
            return this.getView("reset_pwd");
        }

        if (codes.getIs_use() == 1) {
            request.attribute(this.ERROR, "激活码已经被使用");
            return this.getView("reset_pwd");
        }

        User user = userService.getUserById(codes.getUid());
        if (null == user) {
            request.attribute(this.ERROR, "激活码已经被使用");
            return this.getView("reset_pwd");
        }

        String new_pwd = EncrypKit.md5(user.getUsername() + password);

        try {
            userService.update(User.builder().uid(user.getUid()).password(new_pwd).build());
            codesService.useCode(code);
            request.attribute(this.INFO, "密码修改成功，您可以直接登录！");
        } catch (Exception e) {
            String msg = "密码修改失败";
            if (e instanceof TipException) {
                msg = e.getMessage();
            } else {
                log.error(msg, e);
            }
            request.attribute(this.ERROR, msg);
        }
        return this.getView("reset_pwd");
    }

    /**
     * 用户主页
     */
    @Route(value = "/member/:username", method = HttpMethod.GET)
    public ModelAndView member(@PathParam("username") String username,
                               Request request, Response response) {

        Take up = new Take(User.class);
        up.eq("status", 1).eq("login_name", username);

        User user = userService.getUserByTake(up);
        if (null == user) {
            // 不存在的用户
            response.text("not found user.");
            return null;
        }

        Map<String, Object> profile = userService.getUserDetail(user.getUid());
        request.attribute("profile", profile);

        // 是否关注了该用户
        LoginUser loginUser = SessionKit.getLoginUser();
        if (null == loginUser) {
            request.attribute("is_follow", false);
            SessionKit.setCookie(response, Constant.JC_REFERRER_COOKIE, request.url());
        } else {
            boolean is_follow = favoriteService.isFavorite(Favorite.builder().event_type("user").favorite_type(Actions.FOLLOW).uid(loginUser.getUid()).event_id(user.getUid().toString()).build());
            request.attribute("is_follow", is_follow);
        }

        // 最新创建的主题
        Take tp = new Take(Topic.class);
        tp.eq("status", 1).eq("uid", user.getUid()).orderby("created desc, updated desc").page(1, 10);
        Paginator<Map<String, Object>> topicPage = topicService.getPageList(tp);
        request.attribute("topicPage", topicPage);

        // 最新发布的回复
        Take cp = new Take(Comment.class);
        cp.eq("uid", user.getUid()).orderby("created desc").page(1, 10);
        Paginator<Map<String, Object>> commentPage = null;//commentService.getPageListMap(cp);
        request.attribute("commentPage", commentPage);

        return this.getView("member_detail");
    }

    /**
     * 我收藏的帖子
     */
    @Route(value = "/my/topics")
    @Access
    public ModelAndView myTopics(Request request, Response response) {
        Integer page = request.queryInt("p", 1);
//        Paginator<Map<String, Object>> favoritesPage = favoriteService.getMyTopics(user.getUid(), page, 10);
//        request.attribute("favoritesPage", favoritesPage);
        return this.getView("my_topics");
    }

    /**
     * 我收藏的节点
     */
    @Route(value = "/my/nodes")
    @Access
    public ModelAndView myNodes(Request request, Response response) {
//        List<Map<String, Object>> nodes = favoriteService.getMyNodes(user.getUid());
//        request.attribute("nodes", nodes);

        return this.getView("my_nodes");
    }

    /**
     * 我的关注
     */
    @Route(value = "/my/following")
    @Access
    public ModelAndView following(Request request, Response response) {

        Integer page = request.queryInt("p", 1);
//        Paginator<Map<String, Object>> followingPage = favoriteService.getFollowing(user.getUid(), page, 10);
//        request.attribute("followingPage", followingPage);

        return this.getView("following");
    }


    /**
     * 关注／收藏／点赞／下沉帖
     */
    @Route(value = "/favorite", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse favorite(Request request, Response response) {
        // topic：帖子，node：节点，love：喜欢，following：关注
        String type = request.query("type");
        Integer event_id = request.queryInt("event_id");

        if (StringKit.isBlank(type) || null == event_id || event_id == 0) {
            return RestResponse.fail();
        }

//        favoriteService.update(type, user.getUid(), event_id);
//        LoginUser loginUser = userService.getLoginUser(null, user.getUid());
//        SessionKit.setLoginUser(request.session(), loginUser);
        return RestResponse.ok();
    }

    /**
     * 个人设置
     */
    @Route(value = "settings", method = HttpMethod.GET)
    @Access
    public ModelAndView show_settings(Request request, Response response) {
        Map<String, Object> profile = userService.getUserDetail(getUid());
        request.attribute("profile", profile);
        return this.getView("settings");
    }

    /**
     * 保存个人设置
     */
    @Route(value = "settings", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse settings(Request request) {
        String type = request.query("type");
        if (StringKit.isBlank(type)) {
            return RestResponse.fail("类型不能为空");
        }

        LoginUser loginUser = getLoginUser();

        String avatar = request.query("avatar");
        // 修改头像
        if (type.equals("avatar") && StringKit.isNotBlank(avatar)) {
            try {
                User temp = new User();
                temp.setUid(getUid());
                temp.setAvatar(avatar);
                userService.update(temp);
                getLoginUser().setAvatar(avatar);
                return RestResponse.ok();
            } catch (Exception e) {
                String msg = "头像更换失败";
                return fail(e, msg);
            }
        }

        // 修改基本信息
        if (type.equals("info")) {
            String jobs = request.query("jobs");
            String webSite = request.query("web_site");
            String github = request.query("github");
            String weibo = request.query("weibo");
            String location = request.query("location");
            String signature = request.query("signature");
            String instructions = request.query("instructions");

            try {

                UserInfo userInfo = new UserInfo();
                userInfo.setUid(getUid());
                userInfo.setJobs(jobs);
                userInfo.setWeb_site(webSite);
                userInfo.setGithub(github);
                userInfo.setWeibo(weibo);
                userInfo.setLocation(location);
                userInfo.setSignature(signature);
                userInfo.setInstructions(instructions);

                userInfoService.update(userInfo);

                LoginUser loginUserTemp = userService.getLoginUser(null, getUid());
                SessionKit.setLoginUser(request.session(), loginUserTemp);
                return RestResponse.ok();
            } catch (Exception e) {
                String msg = "修改失败";
                return fail(e, msg);
            }
        }

        // 修改密码
        if (type.equals("pwd")) {

            String curpwd = request.query("curpwd");
            String newpwd = request.query("newpwd");
            String renewpwd = request.query("renewpwd");
            if (StringKit.isBlank(curpwd)) {
                return RestResponse.fail("请输入旧密码");
            }
            if (StringKit.isBlank(newpwd) || (newpwd.length() > 14 || newpwd.length() < 6)) {
                return RestResponse.fail("请输入6-14位新密码");
            }
            if (!newpwd.equals(renewpwd)) {
                return RestResponse.fail("新密码输入不一致，请确认");
            }

            if (!EncrypKit.md5(loginUser.getUsername() + curpwd).equals(loginUser.getPassword())) {
                return RestResponse.fail("旧密码输入错误");
            }

            try {
                String new_pwd = EncrypKit.md5(loginUser.getUsername() + newpwd);
                userService.update(User.builder().uid(loginUser.getUid()).password(new_pwd).build());

                LoginUser loginUserTemp = userService.getLoginUser(null, loginUser.getUid());
                SessionKit.setLoginUser(request.session(), loginUserTemp);
                userlogService.save(Userlog.builder().uid(loginUser.getUid()).action(Actions.UPDATE_PWD).content(new_pwd).build());
                return RestResponse.ok();
            } catch (Exception e) {
                String msg = "密码修改失败";
                return fail(e, msg);
            }
        }

        return RestResponse.ok();
    }


    /**
     * 上传头像
     */
    @Route(value = "/uploadimg", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse uploadimg(@MultipartParam("avatar") FileItem fileItem) {
        if (null != fileItem) {
            String suffix = FileKit.getExtension(fileItem.fileName());
            if (StringKit.isNotBlank(suffix)) {
                suffix = "." + suffix;
            }
            if (!Utils.isImage(fileItem.file())) {
                return RestResponse.fail("不是图片类型");
            }
            if (fileItem.file().length() / 1000 > 512000) {
                return RestResponse.fail("请上传小于5M的图片");
            }
            LoginUser user = getLoginUser();
            String saveName = "avatar/" + user.getUsername() + "/" + StringKit.getRandomChar(10) + suffix;
            String filePath = upDir + saveName;
            File file = new File(filePath);
            try {
                if (!FileKit.isDirectory(file.getParent())) {
                    new File(file.getParent()).mkdirs();
                }
                Tools.copyFileUsingFileChannels(fileItem.file(), file);
                Map<String, String> res = new HashMap<>();
                res.put("status", "200");
                res.put("savepath", saveName);
                res.put("url", Constant.SITE_URL + "/upload/" + saveName);
                return RestResponse.ok(res);
            } catch (Exception e) {
                String msg = "上传失败";
                return fail(e, msg);
            }
        }
        return RestResponse.ok();
    }

    /**
     * 显示markdown预览
     */
    @Route(value = "markdown", method = HttpMethod.POST)
    @JSON
    @Access
    public RestResponse getMarkdown(Request request) {
        String content = request.query("content");
        return RestResponse.ok(Utils.markdown2html(content));
    }

}
