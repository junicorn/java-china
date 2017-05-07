package com.javachina.constants;

import com.blade.kit.base.Config;
import jetbrick.template.JetGlobalContext;

import java.util.HashMap;
import java.util.Map;

/**
 * 常量类
 */
public final class Constant {

    public static Config config = new Config();

    /**
     * 登录用户session key
     */
    public static final String LOGIN_SESSION_KEY = "login_user";

    public static final String USER_IN_COOKIE = "SH_SIGNIN_USER";

    public static final String JC_REFERRER_COOKIE = "JC_REFERRER_COOKIE";

    /**
     * cache key
     */
    public static final String C_HOME_NODE_KEY = "home:nodes";
    public static final String C_HOME_FAMOUS_KEY = "home:famousDay";
    public static final String C_HOT_TOPICS = "topic:hot";
    public static final String C_HOT_NODES = "node:hot";
    public static final String C_TOPIC_VIEWS = "topic:views";

    /**
     * 网站地址
     */
    public static String SITE_URL;

    /**
     * AES盐值
     */
    public static String AES_SALT;

    /**
     * 资源上传路径
     */
    public static String UPLOAD_DIR;

    /**
     * github密钥配置
     */
    public static String GITHUB_CLIENT_ID;
    public static String GITHUB_CLIENT_SECRET;
    public static String GITHUB_REDIRECT_URL;

    /**
     * 邮件配置
     */
    public static String MAIL_HOST;
    public static String MAIL_USER;
    public static String MAIL_USERNAME;
    public static String MAIL_PASS;

    public static JetGlobalContext VIEW_CONTEXT = null;
    public static Map<String, Object> SYS_INFO = new HashMap<>();

}
