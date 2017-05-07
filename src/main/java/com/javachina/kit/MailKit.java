package com.javachina.kit;

import com.javachina.constants.Constant;
import org.apache.commons.mail.HtmlEmail;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by biezhi on 2016/12/30.
 */
public class MailKit {

    private static ExecutorService executorService = Executors.newFixedThreadPool(3);

    public static void sendForgot(String login_name, String email, String code) {

    }

    public static void sendSignup(String login_name, String to_addr, String code) {
        String url = Constant.SITE_URL + "/active/" + code;
        String content = "您的激活链接是：<a href='" + url + "'>" + url + "</a> 点击链接激活账号！";
        send(login_name + ", 欢迎你加入" + Constant.MAIL_USERNAME, to_addr, content);
    }

    public static void send(final String subject, final String to_addr, final String content) {
        executorService.execute(() -> {
            try {
                // Create the email message
                HtmlEmail email = new HtmlEmail();
                email.setHostName(Constant.MAIL_HOST);
                email.addTo(to_addr);
                //email.setStartTLSEnabled(true);
                email.setFrom(Constant.MAIL_USER, Constant.MAIL_USERNAME);
                email.setAuthentication(Constant.MAIL_USER, Constant.MAIL_PASS);
                email.setCharset("UTF-8");

                email.setSubject(subject);
                // set the html message
                email.setHtmlMsg(content);
                // send the email
                email.send();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });

    }


}
