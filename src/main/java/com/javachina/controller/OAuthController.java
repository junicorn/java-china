package com.javachina.controller;

import com.blade.ioc.annotation.Inject;
import com.blade.kit.StringKit;
import com.blade.kit.http.HttpRequest;
import com.blade.kit.json.JSONKit;
import com.blade.kit.json.JSONObject;
import com.blade.mvc.annotation.Controller;
import com.blade.mvc.annotation.JSON;
import com.blade.mvc.annotation.Route;
import com.blade.mvc.http.HttpMethod;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.view.ModelAndView;
import com.blade.mvc.view.RestResponse;
import com.javachina.constants.Constant;
import com.javachina.constants.EventType;
import com.javachina.dto.LoginUser;
import com.javachina.kit.SessionKit;
import com.javachina.model.Openid;
import com.javachina.model.User;
import com.javachina.service.OpenIdService;
import com.javachina.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

/**
 * oauth认证控制器
 */
@Controller("/oauth/")
@Slf4j
public class OAuthController extends BaseController {

    @Inject
    private UserService userService;

    @Inject
    private OpenIdService openIdService;

    /**
     * github回调
     */
    @Route(value = "/github")
    public void github(Response response) {
        try {
            String url = "https://github.com/login/oauth/authorize?client_id=%s&redirect_uri=%s&state=%s";
            String redirect_uri = URLEncoder.encode(Constant.GITHUB_REDIRECT_URL, "utf-8");
            response.redirect(String.format(url, Constant.GITHUB_CLIENT_ID, redirect_uri, StringKit.getRandomNumber(15)));
        } catch (Exception e) {
            log.error("github回调失败", e);
        }
    }

    /**
     * github回调
     */
    @Route(value = "/github/call")
    public ModelAndView githubCall(Request request, Response response) {
        String code = request.query("code");
        if (StringKit.isNotBlank(code)) {
            log.info("code = {}", code);

            String body = HttpRequest.post("https://github.com/login/oauth/access_token", true,
                    "client_id", Constant.GITHUB_CLIENT_ID, "client_secret", Constant.GITHUB_CLIENT_SECRET, "code", code)
                    .accept("application/json").trustAllCerts().trustAllHosts().body();

            log.info("body = {}", body);

            JSONObject result = JSONKit.parseObject(body);
            String access_token = result.getString("access_token");

            String body_ = HttpRequest.get("https://api.github.com/user?access_token=" + access_token).body();

            System.out.println("body = " + body_);

            JSONObject user = JSONKit.parseObject(body_);
            Integer open_id = user.getInt("id");
            String login = user.getString("login");

            // 判断用户是否已经绑定
            Openid openid = openIdService.getOpenid(EventType.GITHUB, open_id);
            if (null == openid) {
                Map<String, String> githubInfo = new HashMap<String, String>(3);
                githubInfo.put("login_name", login);
                githubInfo.put("open_id", open_id.toString());

                SessionKit.set(request.session(), EventType.GITHUB, githubInfo);

                response.go("/oauth/user/bind");
            } else {
                User user_ = userService.getUserById(openid.getUid());
                if (null == user_) {
                    request.attribute(this.INFO, "不存在该用户");
                    return this.getView("info");
                }

                if (user_.getStatus() == 0) {
                    request.attribute(this.INFO, "该用户未激活，无法登录");
                    return this.getView("info");
                }

                LoginUser loginUser = userService.getLoginUser(null, openid.getUid());
                SessionKit.setLoginUser(request.session(), loginUser);
                response.go("/");
            }
        } else {
            request.attribute(this.ERROR, "请求发生异常");
            return this.getView("info");
        }
        return null;
    }

    @Route(value = "/user/bind", method = HttpMethod.GET)
    public ModelAndView bindPage(Request request, Response response) {
        Map<String, String> githubInfo = request.session().attribute(EventType.GITHUB);
        LoginUser loginUser = SessionKit.getLoginUser();
        if (null == githubInfo || null != loginUser) {
            response.go("/");
            return null;
        }
        return this.getView("github");
    }

    /**
     * 绑定github帐号
     */
    @Route(value = "/user/bind", method = HttpMethod.POST)
    @JSON
    public RestResponse bindCheck(Request request, Response response) {
        Map<String, String> githubInfo = request.session().attribute(EventType.GITHUB);
        if (null == githubInfo) {
            response.go("/");
            return null;
        }

        String type = request.query("type");
        String username = request.query("username");
        String password = request.query("password");

        if (StringKit.isBlank(type) || StringKit.isBlank(username) || StringKit.isBlank(password)) {
            return RestResponse.fail("绑定失败");
        }

        if (type.equals("signin")) {

            boolean hasUser = userService.hasUser(username);
            if (!hasUser) {
                return RestResponse.fail("不存在该用户");
            }

            LoginUser user = userService.signin(username, password);
            if (null == user) {
                return RestResponse.fail("密码错误");
            }
            if (user.getStatus() == 0) {
                return RestResponse.fail("用户未激活");
            }

            Integer open_id = Integer.valueOf(githubInfo.get("open_id"));
            boolean flag = openIdService.save(EventType.GITHUB, open_id, user.getUid());
            if (flag) {
                SessionKit.setLoginUser(request.session(), user);
                return RestResponse.ok();
            }
        }

        if (type.equals("signup")) {
            String email = request.query("email");
            if (StringKit.isBlank(email)) {
                return RestResponse.fail("邮箱不能为空");
            }

            boolean has = userService.hasUser(username);
            if (has) {
                return RestResponse.fail("用户名已经存在");
            }

            try {
                User user_ = userService.signup(username, password, email);
                if (null != user_) {
                    Integer open_id = Integer.valueOf(githubInfo.get("open_id"));
                    boolean saveFlag = openIdService.save(EventType.GITHUB, open_id, user_.getUid());
                    if (saveFlag) {
                        request.session().removeAttribute(EventType.GITHUB);
                        return RestResponse.ok();
                    }
                } else {
                    return RestResponse.fail();
                }
            } catch (Exception e) {
                log.error("注册失败", e);
            }
        }

        return RestResponse.ok();
    }

}
