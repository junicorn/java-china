package com.javachina.ext;

import com.blade.jdbc.model.Paginator;
import com.blade.kit.*;
import com.vdurmont.emoji.EmojiParser;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * 公共函数
 * <p>
 * Created by biezhi on 2017/2/21.
 */
public final class Commons {

    private static final List EMPTY = new ArrayList(0);

    private static final Random rand = new Random();

    private static final String TEMPLATES = "/templates/";

    /**
     * 判断分页中是否有数据
     *
     * @param paginator
     * @return
     */
    public static boolean is_empty(Paginator paginator) {
        return null == paginator || CollectionKit.isEmpty(paginator.getList());
    }

    /**
     * 截取字符串
     *
     * @param str
     * @param len
     * @return
     */
    public static String substr(String str, int len) {
        if (str.length() > len) {
            return str.substring(0, len);
        }
        return str;
    }

    /**
     * 返回gravatar头像地址
     *
     * @param email
     * @return
     */
    public static String gravatar(String email) {
        String avatarUrl = "https://secure.gravatar.com/avatar";
        if (StringKit.isBlank(email)) {
            return avatarUrl;
        }
        String hash = Tools.md5(email.trim().toLowerCase());
        return avatarUrl + "/" + hash;
    }

    /**
     * 格式化unix时间戳为日期
     *
     * @param unixTime
     * @return
     */
    public static String fmtdate(Integer unixTime) {
        return fmtdate(unixTime, "yyyy-MM-dd");
    }

    /**
     * 格式化日期
     *
     * @param date
     * @param fmt
     * @return
     */
    public static String fmtdate(Date date, String fmt) {
        return DateKit.dateFormat(date, fmt);
    }

    /**
     * 格式化unix时间戳为日期
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

    /**
     * 获取随机数
     *
     * @param max
     * @param str
     * @return
     */
    public static String random(int max, String str) {
        return UUID.random(1, max) + str;
    }

    /**
     * An :grinning:awesome :smiley:string &#128516;with a few :wink:emojis!
     * <p>
     * 这种格式的字符转换为emoji表情
     *
     * @param value
     * @return
     */
    public static String emoji(String value) {
        return EmojiParser.parseToUnicode(value);
    }

}
