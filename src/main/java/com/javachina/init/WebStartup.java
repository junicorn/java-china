package com.javachina.init;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.blade.config.BConfig;
import com.blade.context.WebContextListener;
import com.blade.ioc.BeanProcessor;
import com.blade.ioc.Ioc;
import com.blade.jdbc.ActiveRecord;
import com.blade.jdbc.ar.SampleActiveRecord;
import com.blade.kit.base.Config;
import com.blade.mvc.view.ViewSettings;
import com.blade.mvc.view.template.JetbrickTemplateEngine;
import com.javachina.constants.Constant;
import com.javachina.ext.Funcs;
import jetbrick.template.JetGlobalContext;
import jetbrick.template.resolver.GlobalResolver;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContext;
import javax.sql.DataSource;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by biezhi on 2017/3/15.
 */
@Slf4j
public class WebStartup implements BeanProcessor, WebContextListener {

    @Override
    public void init(BConfig bConfig, ServletContext sec) {
        JetbrickTemplateEngine templateEngine = new JetbrickTemplateEngine();
        JetGlobalContext context = templateEngine.getGlobalContext();
        GlobalResolver resolver = templateEngine.getGlobalResolver();
        resolver.registerFunctions(Funcs.class);

        Config config = bConfig.config();
        String version = config.get("app.version", "1.0");
        String cdnUrl = config.get("app.cdn_url", config.get("app.site_url") + "/upload");

        Constant.VIEW_CONTEXT = context;
        Constant.VIEW_CONTEXT.set("cdn_url", cdnUrl);
        Constant.VIEW_CONTEXT.set("version", version);

        Constant.SITE_URL = config.get("app.site_url");
        Constant.AES_SALT = config.get("app.aes_salt", "0123456789abcdef");
        Constant.UPLOAD_DIR = config.get("app.upload_dir");

        /**
         * github密钥配置
         */
        Constant.GITHUB_CLIENT_ID = config.get("github.client_id");
        Constant.GITHUB_CLIENT_SECRET = config.get("github.client_secret");
        Constant.GITHUB_REDIRECT_URL = config.get("github.redirect_url");

        /**
         * 邮件配置
         */
        Constant.MAIL_HOST = config.get("mail.smtp.host");
        Constant.MAIL_USER = config.get("mail.user");
        Constant.MAIL_USERNAME = config.get("mail.from");
        Constant.MAIL_PASS = config.get("mail.pass");

        Constant.config = config;

        ViewSettings.$().templateEngine(templateEngine);
    }

    @Override
    public void register(Ioc ioc) {
        try {
            InputStream in = WebStartup.class.getClassLoader().getResourceAsStream("druid.properties");
            Properties props = new Properties();
            props.load(in);
            DataSource dataSource = DruidDataSourceFactory.createDataSource(props);
            ActiveRecord activeRecord = new SampleActiveRecord(dataSource);
            ioc.addBean(activeRecord);
        } catch (Exception ex) {
            log.error("初始化数据库配置失败", ex);
        }
    }
}
