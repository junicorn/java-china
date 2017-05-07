package com.javachina.ext;

import com.blade.jdbc.ActiveRecord;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.javachina.constants.Constant;
import com.javachina.dto.LoginUser;
import com.javachina.kit.SessionKit;
import com.javachina.model.Remind;

public class TplFunctions {

    private static ActiveRecord activeRecord;

    public static void setActiveRecord(ActiveRecord ar) {
        activeRecord = ar;
    }

    /**
     * 获取相对路径
     *
     * @param path
     * @return
     */
    public static String base_url(String path) {
        return Constant.SITE_URL + path;
    }

    /**
     * 取某个区间的随机数
     *
     * @param max
     * @return
     */
    public static int random(int max) {
        int radom = Integer.valueOf(StringKit.getRandomNumber(1, max));
        if (radom == 0) {
            return 1;
        }
        return radom;
    }

    public static String avatar_url(String avatar) {
        if (!avatar.startsWith("http")) {
            return Constant.SITE_URL + "/upload/" + avatar;
        }
        return avatar;
    }

    /**
     * 格式化日期
     *
     * @param unixTime
     * @return
     */
    public static String fmtdate(Integer unixTime) {
        if (null != unixTime) {
            return DateKit.formatDateByUnixTime(unixTime, "yyyy-MM-dd");
        }
        return "";
    }

    /**
     * 格式化日期
     *
     * @param unixTime
     * @param patten
     * @return
     */
    public static String fmtdate(Integer unixTime, String patten) {
        if (null != unixTime && StringKit.isNotBlank(patten)) {
            return DateKit.formatDateByUnixTime(unixTime, patten);
        }
        return "";
    }

    public static String today(String patten) {
        return fmtdate(DateKit.getCurrentUnixTime(), patten);
    }

    /**
     * 截取字符串个数
     *
     * @param str
     * @param count
     * @return
     */
    public static String str_count(String str, int count) {
        if (StringKit.isNotBlank(str) && count > 0) {
            if (str.length() <= count) {
                return str;
            }
            return str.substring(0, count);
        }
        return "";
    }

    /**
     * 显示时间，如果与当前时间差别小于一天，则自动用**秒(分，小时)前，如果大于一天则用format规定的格式显示
     *
     * @param ctime 时间
     * @return
     */
    public static String timespan(Integer ctime) {
        String r = "";
        if (ctime == null)
            return r;

        long nowtimelong = System.currentTimeMillis();
        long ctimelong = DateKit.getDateByUnixTime(ctime).getTime();
        long result = Math.abs(nowtimelong - ctimelong);

        // 20秒内
        if (result < 20000) {
            r = "刚刚";
        } else if (result >= 20000 && result < 60000) {
            // 一分钟内
            long seconds = result / 1000;
            r = seconds + "秒钟前";
        } else if (result >= 60000 && result < 3600000) {
            // 一小时内
            long seconds = result / 60000;
            r = seconds + "分钟前";
        } else if (result >= 3600000 && result < 86400000) {
            // 一天内
            long seconds = result / 3600000;
            r = seconds + "小时前";
        } else {
            long days = result / 3600000 / 24;
            r = days + "天前";
        }
        return r;
    }

    /**
     * 读取我的未读
     *
     * @return
     */
    public static int unreads() {
        LoginUser loginUser = SessionKit.getLoginUser();
        if (null != loginUser) {
            return activeRecord.count(Remind.builder().to_user(loginUser.getUsername()).is_read(false).build());
        }
        return 0;
    }
}
