package com.javachina.kit;

import com.blade.context.WebContextHolder;
import com.blade.kit.StringKit;
import com.blade.mvc.http.Request;
import com.blade.mvc.http.Response;
import com.blade.mvc.http.wrapper.Session;
import com.javachina.constants.Constant;
import com.javachina.dto.LoginUser;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class SessionKit {

    public static void set(Session session, String name, Object value) {
        if (null != session && StringKit.isNotBlank(name) && null != value) {
            removeUser(session);
            session.attribute(name, value);
        }
    }

    public static <T> T get(Session session, String name) {
        if (null != session && StringKit.isNotBlank(name)) {
            return session.attribute(name);
        }
        return null;
    }

    public static void setLoginUser(Session session, LoginUser login_user) {
        if (null != session && null != login_user) {
            removeUser(session);
            session.attribute(Constant.LOGIN_SESSION_KEY, login_user);
        }
    }

    public static void removeUser(Session session) {
        session.removeAttribute(Constant.LOGIN_SESSION_KEY);
    }

    public static LoginUser getLoginUser() {
        Session session = WebContextHolder.me().session();
        if (null == session) {
            return null;
        }
        LoginUser user = session.attribute(Constant.LOGIN_SESSION_KEY);
        return user;
    }

    private static final int one_month = 30 * 24 * 60 * 60;

    public static void setCookie(Response response, String cookieName, Integer uid) {
        if (null != response && StringKit.isNotBlank(cookieName) && null != uid) {
            try {
                String val = Utils.encrypt(uid.toString(), Constant.AES_SALT);
                boolean isSSL = Constant.SITE_URL.startsWith("https");
                response.cookie("/", cookieName, val, one_month, isSSL);
            } catch (Exception e) {
            }
        }
    }

    public static void setCookie(Response response, String cookieName, String value) {
        if (null != response && StringKit.isNotBlank(cookieName) && StringKit.isNotBlank(value)) {

            try {
                String data = Utils.encrypt(value, Constant.AES_SALT);
                boolean isSSL = Constant.SITE_URL.startsWith("https");
                response.removeCookie(cookieName);

                String path = WebContextHolder.servletContext().getContextPath();
                response.cookie(path, cookieName, data, 604800, isSSL);
            } catch (Exception e) {
            }
        }
    }

    public static String getCookie(Request request, String cookieName) {
        if (null != request && StringKit.isNotBlank(cookieName)) {
            String val = request.cookie(cookieName);
            if (StringKit.isNotBlank(val)) {
                try {
                    return Utils.decrypt(val, Constant.AES_SALT);
                } catch (Exception e) {
                }
                return "";
            }
        }
        return null;
    }

    public static void removeCookie(Response response) {
        response.removeCookie(Constant.USER_IN_COOKIE);
        response.removeCookie(Constant.JC_REFERRER_COOKIE);
    }

    public static String decode(String source, String enc) {
        if (source == null || "".equals(source))
            return "";
        String ret = "";
        try {
            ret = URLDecoder.decode(source, enc);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return ret;
    }

    public static String encode(String source, String enc) {
        if (source == null || "".equals(source))
            return "";
        String ret = "";
        try {
            ret = URLEncoder.encode(source, enc);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return ret;
    }
}
