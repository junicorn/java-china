package com.javachina.controller;

import com.blade.ioc.annotation.Inject;
import com.blade.jdbc.core.Take;
import com.blade.kit.DateKit;
import com.blade.kit.PatternKit;
import com.blade.kit.StringKit;
import com.blade.mvc.annotation.*;
import com.blade.mvc.http.HttpMethod;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.view.ModelAndView;
import com.blade.mvc.view.RestResponse;
import com.blade.patchca.DefaultPatchca;
import com.blade.patchca.Patchca;
import com.javachina.constants.Actions;
import com.javachina.constants.Constant;
import com.javachina.constants.EventType;
import com.javachina.dto.LoginUser;
import com.javachina.exception.TipException;
import com.javachina.kit.SessionKit;
import com.javachina.kit.Utils;
import com.javachina.model.Codes;
import com.javachina.model.User;
import com.javachina.model.Userlog;
import com.javachina.service.*;
import lombok.extern.slf4j.Slf4j;

/**
 * 注册，登录，找回密码，激活
 */
@Controller
@Slf4j
public class AuthController extends BaseController {

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

    private Patchca patchca = new DefaultPatchca();

    /**
     * 获取验证码
     */
    @Route(value = "/captcha", method = HttpMethod.GET)
    public void show_captcha(Request request, Response response) {
        try {
            patchca.render(request, response);
        } catch (Exception e) {
            log.error("获取验证码失败", e);
        }
    }

    /**
     * 登录页面
     */
    @Route(value = "/signin", method = HttpMethod.GET)
    public ModelAndView show_signin() {
        return this.getView("signin");
    }

    /**
     * 登录操作
     */
    @Route(value = "/signin", method = HttpMethod.POST)
    @JSON
    public RestResponse signin(Request request, Response response,
                               @QueryParam String username, @QueryParam String password,
                               @QueryParam String rememberMe) {

        try {
            LoginUser loginUser = userService.signin(username, password);
            SessionKit.setLoginUser(request.session(), loginUser);

            if (StringKit.isNotBlank(rememberMe) && rememberMe.equals("on")) {
                SessionKit.setCookie(response, Constant.USER_IN_COOKIE, loginUser.getUid());
            }

            userlogService.save(Userlog.builder().uid(loginUser.getUid()).action(Actions.SIGNIN).content(username).build());
            String val = SessionKit.getCookie(request, Constant.JC_REFERRER_COOKIE);
            if (StringKit.isNotBlank(val)) {
                response.redirect(val);
                return null;
            }
            return RestResponse.ok(val);
        } catch (Exception e) {
            return fail(e, "登录失败");
        }

    }

    /**
     * 注册页面
     */
    @Route(value = "/signup", method = HttpMethod.GET)
    public ModelAndView show_signup(Request request) {
        Object allow_signup = Constant.SYS_INFO.get(EventType.ALLOW_SIGNUP);
        if (null != allow_signup && allow_signup.toString().equals("false")) {
            request.attribute(this.INFO, "暂时停止注册");
        }
        return this.getView("signup");
    }

    /**
     * 注销
     */
    @Route(value = "/logout")
    public void logout(Request request, Response response) {
        SessionKit.removeUser(request.session());
        SessionKit.removeCookie(response);
        response.go("/");
    }

    /**
     * 注册操作
     */
    @Route(value = "/signup", method = HttpMethod.POST)
    public RestResponse signup(Request request, Response response) {

        String username = request.query("username");
        String email = request.query("email");
        String password = request.query("password");
        String auth_code = request.query("auth_code");

        if (StringKit.isBlank(username) || StringKit.isBlank(password)
                || StringKit.isBlank(email) || StringKit.isBlank(auth_code)) {
            return RestResponse.fail("参数不能为空");
        }

        if (username.length() > 16 || username.length() < 4) {
            return RestResponse.fail("请输入4-16位用户名");
        }

        if (!Utils.isLegalName(username)) {
            return RestResponse.fail("请输入只包含字母／数字／下划线的用户名");
        }

        if (!Utils.isSignup(username)) {
            return RestResponse.fail("您的用户名中包含禁用字符，请修改后注册");
        }

        if (!Utils.isEmail(email)) {
            return RestResponse.fail("请输入正确的邮箱");
        }

        if (password.length() > 20 || password.length() < 6) {
            request.attribute(this.ERROR, "请输入6-20位字符的密码");
            return RestResponse.fail("请输入6-20位字符的密码");
        }

        String patchca = request.session().attribute("patchca");
        if (StringKit.isNotBlank(patchca) && !patchca.equalsIgnoreCase(auth_code)) {
            return RestResponse.fail("验证码输入错误");
        }

        Take queryParam = new Take(User.class);
        queryParam.eq("username", username);
        queryParam.in("status", 0, 1);
        User user = userService.getUserByTake(queryParam);
        if (null != user) {
            request.attribute(this.ERROR, "该用户名已经被占用，请更换用户名");
            return RestResponse.fail("该用户名已经被占用，请更换用户名");
        }

        queryParam = new Take(User.class);
        queryParam.eq("email", email);
        queryParam.in("status", 0, 1);
        user = userService.getUserByTake(queryParam);
        if (null != user) {
            return RestResponse.fail("该邮箱已经被注册，请直接登录");
        }

        try {

            username = Utils.cleanXSS(username);

            User user_ = userService.signup(username, password, email);
            if (null != user_) {
                userlogService.save(Userlog.builder().uid(user_.getUid()).action(Actions.SIGNUP).content(username + ":" + email).build());
                return RestResponse.ok("注册成功，已经向您的邮箱 " + email + " 发送了一封激活申请，请注意查收！");
            } else {
                return RestResponse.fail("注册发生异常");
            }
        } catch (Exception e) {
            return fail(e, "注册失败");
        }
    }

    /**
     * 激活账户
     */
    @Route(value = "/active/:code", method = HttpMethod.GET)
    public ModelAndView activeAccount(@PathParam("code") String code, Request request, Response response) {
        Codes codes = codesService.getActivecode(code);
        if (null == codes) {
            request.attribute(this.ERROR, "无效的激活码");
            return this.getView("info");
        }

        Integer expries = codes.getExpired();
        if (expries < DateKit.getCurrentUnixTime()) {
            request.attribute(this.ERROR, "该激活码已经过期，请重新发送");
            return this.getView("info");
        }

        if (codes.getIs_use() == 1) {
            request.attribute(this.ERROR, "激活码已经被使用");
            return this.getView("info");
        }

        // 找回密码
        if (codes.getType().equals(EventType.FORGET)) {
            request.attribute("code", code);
            return this.getView("reset_pwd");
        }

        try {
            User temp = User.builder().uid(codes.getUid()).status(1).build();
            userService.update(temp);
            codesService.useCode(code);

            request.attribute(this.INFO, "激活成功，您可以凭密码登陆");
            optionsService.updateCount(EventType.USER_COUNT, +1);
            Constant.SYS_INFO = optionsService.getSystemInfo();
            Constant.VIEW_CONTEXT.set("sys_info", Constant.SYS_INFO);

        } catch (Exception e) {
            String msg = "激活失败";
            if (e instanceof TipException) {
                msg = e.getMessage();
            } else {
                log.error(msg, e);
            }
            request.attribute(this.ERROR, msg);
        }
        return this.getView("active");
    }

    /**
     * 忘记密码页面
     */
    @Route(value = "/forgot", method = HttpMethod.GET)
    public String show_forgot() {
        return "forgot";
    }

    /**
     * 忘记密码发送链接
     */
    @Route(value = "/forgot", method = HttpMethod.POST)
    public ModelAndView forgot(Request request, @QueryParam String email) {
        if (StringKit.isBlank(email)) {
            request.attribute(this.ERROR, "邮箱不能为空");
            return this.getView("forgot");
        }

        if (!PatternKit.isEmail(email)) {
            request.attribute(this.ERROR, "请输入正确的邮箱");
            request.attribute("email", email);
            return this.getView("forgot");
        }

        User user = userService.getUserByTake(new Take(User.class).eq("email", email));
        if (null == user) {
            request.attribute(this.ERROR, "该邮箱没有注册账户,请检查您的邮箱是否正确");
            request.attribute("email", email);
            return this.getView("forgot");
        }
        if (user.getStatus() == 0) {
            request.attribute(this.ERROR, "该邮箱未激活");
            request.attribute("email", email);
            return this.getView("forgot");
        }
        try {
            String code = codesService.save(user, "forgot");
            if (StringKit.isNotBlank(code)) {
                request.attribute(this.INFO, "修改密码链接已经发送到您的邮箱，请注意查收！");
            } else {
                request.attribute(this.ERROR, "找回密码失败");
            }
        } catch (Exception e) {
            String msg = "找回密码失败";
            if (e instanceof TipException) {
                msg = e.getMessage();
            } else {
                log.error(msg, e);
            }
            request.attribute(this.ERROR, msg);
        }
        return this.getView("forgot");
    }

}
