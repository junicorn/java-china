package com.javachina.controller;

import com.blade.kit.StringKit;
import com.blade.kit.json.JSONObject;
import com.blade.mvc.http.Response;
import com.blade.mvc.view.ModelAndView;
import com.blade.mvc.view.RestResponse;
import com.javachina.dto.LoginUser;
import com.javachina.exception.TipException;
import com.javachina.kit.SessionKit;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.HashMap;
import java.util.Map;

/**
 * 控制器基类
 */
@Slf4j
public class BaseController {

    protected final String ERROR = "error";
    protected final String INFO = "info";
    protected final String SUCCESS = "success";
    protected final String FAILURE = "failure";

    public ModelAndView getView(String view) {
        return getView(new HashMap<>(), view);
    }

    /**
     * 返回前台页面
     *
     * @param map
     * @param view
     * @return
     */
    public ModelAndView getView(Map<String, Object> map, String view) {
        return new ModelAndView(map, view + ".html");
    }

    /**
     * 返回后台页面
     *
     * @param view
     * @return
     */
    public ModelAndView getAdminView(String view) {
        return this.getView("/admin/" + view);
    }

    /**
     * 成功
     *
     * @param response
     * @param data
     */
    public void success(Response response, Object data) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 200);
        jsonObject.put("data", data);
        response.json(jsonObject.toString());
    }

    /**
     * 出现错误
     *
     * @param response
     * @param msg
     */
    public void error(Response response, String msg) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 500);
        jsonObject.put("msg", msg);
        response.json(jsonObject.toString());
    }

    public RestResponse fail(Exception e, String msg) {
        if (e instanceof TipException) {
            msg = e.getMessage();
        } else {
            log.error(msg, e);
        }
        return RestResponse.fail(msg);
    }

    /**
     * 没有登录
     *
     * @param response
     */
    public void nosignin(Response response) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status", 401);
        response.json(jsonObject.toString());
    }

    public LoginUser getLoginUser() {
        LoginUser user = SessionKit.getLoginUser();
        return user;
    }

    public Integer getUid() {
        LoginUser user = getLoginUser();
        return null != user ? user.getUid() : null;
    }

}
