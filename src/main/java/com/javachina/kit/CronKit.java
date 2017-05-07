package com.javachina.kit;

import com.blade.Blade;
import com.blade.kit.DateKit;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;

/**
 * 定时任务工具类
 */
@Slf4j
public class CronKit {

    /**
     * 备份数据库
     */
    public static void backup() throws Exception {

        Blade blade = Blade.$();

        String sqlpath = "/home/backup/";
        String tableName = "backup-" + DateKit.getToday("yyyy-MM-ddHHmmss");

        try {
            String username = blade.config().get("jdbc.user");
            String password = blade.config().get("jdbc.pass");
            String mysqlpaths = "/usr/local/mysql/bin/";

            String address = "127.0.0.1";
            String databaseName = "javachina";

            File backupath = new File(sqlpath);
            if (!backupath.exists()) {
                backupath.mkdir();
            }
            StringBuffer sb = new StringBuffer();
            sb.append(mysqlpaths);
            sb.append("mysqldump ");
            sb.append("--opt ");
            sb.append("-h ");
            sb.append(address);
            sb.append(" ");
            sb.append("--user=");
            sb.append(username);
            sb.append(" ");
            sb.append("--password=");
            sb.append(password);
            sb.append(" ");
            sb.append("--lock-all-tables=true ");
            sb.append("--result-file=");
            sb.append(sqlpath + tableName + ".sql");
            sb.append(" ");
            sb.append("--default-character-set=utf8 ");
            sb.append(databaseName);
            sb.append(" ");
            sb.append(tableName);
            Runtime cmd = Runtime.getRuntime();
            Process p = cmd.exec(sb.toString());
            p.waitFor(); // 该语句用于标记，如果备份没有完成，则该线程持续等待  

            String file = sqlpath + tableName + ".sql";

            System.out.println("pre send mail:" + file);
            
            /*MailMessage mailMessage = new MailMessage();
            mailMessage
			.subject("javachina数据库备份_" + DateKit.getToday("yyyy-MM-ddHHmmss"))
			.from(Constant.MAIL_NICK, Constant.MAIL_USER)
			.addFile(sqlpath + tableName + ".sql")
			.addTo("biezhi.me@gmail.com");
			
			mailSender.host(Constant.MAIL_HOST).username(Constant.MAIL_USER).password(Constant.MAIL_PASS);
			mailSender.send(mailMessage, true);*/

            System.out.println("send mail end.");

        } catch (Exception e) {
            log.error("备份操作出现问题", e);
        }

    }

}