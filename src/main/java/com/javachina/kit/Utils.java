package com.javachina.kit;

import com.blade.kit.HashidKit;
import com.blade.kit.StringKit;
import com.blade.kit.http.HttpRequest;
import com.blade.kit.json.JSONKit;
import com.blade.mvc.http.Request;
import com.javachina.constants.Constant;
import com.javachina.ext.Commons;
import com.javachina.ext.TplFunctions;
import org.commonmark.Extension;
import org.commonmark.ext.gfm.tables.TablesExtension;
import org.commonmark.node.Node;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.imageio.ImageIO;
import java.awt.*;
import java.io.File;
import java.text.Normalizer;
import java.util.*;
import java.util.List;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 工具类
 */
public class Utils {

    public static FamousDay getTodayFamous() {
        FamousDay famousDay = new FamousDay();
        String key = Constant.config.get("famous.key");
        if (StringKit.isNotBlank(key)) {
            String body = HttpRequest.get("http://api.avatardata.cn/MingRenMingYan/Random?key=" + key).body();
            if (StringKit.isNotBlank(body)) {
                String famous_saying = JSONKit.parseObject(body).get("result").asJSONObject().getString("famous_saying");
                String famous_name = JSONKit.parseObject(body).get("result").asJSONObject().getString("famous_name");
                famousDay.setFamous_saying(famous_saying);
                famousDay.setFamous_name(famous_name);
            }
        } else {
            famousDay.setFamous_saying("好奇的目光常常可以看到比他所希望看到的东西更多。");
            famousDay.setFamous_name("莱辛");
        }
        return famousDay;
    }

    /**
     * 获取ip地址
     *
     * @param request
     * @return
     */
    public static String getIpAddr(Request request) {
        if (null == request) {
            return "0.0.0.0";
        }
        String ip = request.header("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.header("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.header("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.address();
        }
        return ip;
    }

    /**
     * 获取@的用户列表
     *
     * @param str
     * @return
     */
    public static Set<String> getAtUsers(String str) {
        Set<String> users = new HashSet<String>();
        if (StringKit.isNotBlank(str)) {
            Pattern pattern = Pattern.compile("\\@([a-zA-Z_0-9-]+)\\s");
            Matcher matcher = pattern.matcher(str);
            while (matcher.find()) {
                users.add(matcher.group(1));
            }
        }

        return users;
    }

    public static boolean isEmail(String str) {
        if (StringKit.isBlank(str)) {
            return false;
        }
        String check = "^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        Pattern regex = Pattern.compile(check);
        Matcher matcher = regex.matcher(str);
        return matcher.matches();
    }

    /**
     * 判断用户是否可以注册
     *
     * @param user_name
     * @return
     */
    public static boolean isSignup(String user_name) {
        if (StringKit.isNotBlank(user_name)) {
            user_name = user_name.toLowerCase();
            if (user_name.contains("admin") ||
                    user_name.contains("test") ||
                    user_name.contains("support")) {
                return false;
            }
            return true;
        }
        return false;
    }

    public static boolean isLegalName(String str) {
        if (StringKit.isNotBlank(str)) {
            Pattern pattern = Pattern.compile("^[a-zA-Z_0-9]{4,16}$");
            if (!pattern.matcher(str).find()) {
                return false;
            }
            return true;
        }
        return false;
    }

    public static void run(Runnable t) {
        Executors.newSingleThreadExecutor().submit(t);
    }

    /**
     * markdown转换为html
     *
     * @param markdown
     * @return
     */
    public static String markdown2html(String markdown) {
        if (StringKit.isBlank(markdown)) {
            return "";
        }

        List<Extension> extensions = Arrays.asList(TablesExtension.create());
        Parser parser = Parser.builder().extensions(extensions).build();
        Node document = parser.parse(markdown);
        HtmlRenderer renderer = HtmlRenderer.builder().extensions(extensions).build();
        String content = renderer.render(document);

        String member = TplFunctions.base_url("/member/");
        content = content.replaceAll("@([a-zA-Z_0-9-]+)\\s", "<a href='" + member + "$1'>@$1</a>&nbsp;");

        content = Commons.emoji(content);

        // 支持网易云音乐输出
        if (Constant.config.getBoolean("app.support_163_music", true) && content.contains("[mp3:")) {
            content = content.replaceAll("\\[mp3:(\\d+)\\]", "<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=350 height=106 src=\"//music.163.com/outchain/player?type=2&id=$1&auto=0&height=88\"></iframe>");
        }
        // 支持gist代码输出
        if (Constant.config.getBoolean("app.support_gist", true) && content.contains("https://gist.github.com/")) {
            content = content.replaceAll("&lt;script src=\"https://gist.github.com/(\\w+)/(\\w+)\\.js\">&lt;/script>", "<script src=\"https://gist.github.com/$1/$2\\.js\"></script>");
        }
        content = cleanXSS(content);
        return content;
    }

    /**
     * 清除XSS
     * Removes all the potentially malicious characters from a string
     *
     * @param value the raw string
     * @return the sanitized string
     */
    public static String cleanXSS(String value) {
        String cleanValue = null;
        if (value != null) {
            cleanValue = Normalizer.normalize(value, Normalizer.Form.NFD);

            // Avoid null characters
            cleanValue = cleanValue.replaceAll("\0", "");

            // Avoid anything between script tags
            Pattern scriptPattern = Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid anything in a src='...' type of expression
            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            scriptPattern = Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Remove any lonesome </script> tag
            scriptPattern = Pattern.compile("</script>", Pattern.CASE_INSENSITIVE);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Remove any lonesome <script ...> tag
            scriptPattern = Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid eval(...) expressions
            scriptPattern = Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid expression(...) expressions
            scriptPattern = Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid javascript:... expressions
            scriptPattern = Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid vbscript:... expressions
            scriptPattern = Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");

            // Avoid onload= expressions
            scriptPattern = Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL);
            cleanValue = scriptPattern.matcher(cleanValue).replaceAll("");
        }
        return cleanValue;
    }

    /**
     * 判断文件是否是图片类型
     *
     * @param imageFile
     * @return
     */
    public static boolean isImage(File imageFile) {
        if (!imageFile.exists()) {
            return false;
        }
        try {
            Image img = ImageIO.read(imageFile);
            if (img == null || img.getWidth(null) <= 0 || img.getHeight(null) <= 0) {
                return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    /**
     * 计算帖子权重
     * <p>
     * 根据点赞数、收藏数、评论数、下沉数、创建时间计算
     *
     * @param loves     点赞数：权重占比1
     * @param favorites 点赞数：权重占比2
     * @param comment   点赞数：权重占比2
     * @param sinks     点赞数：权重占比-1
     * @param created   创建时间，越早权重越低
     * @return
     */
    public static double getWeight(Integer loves, Integer favorites, Integer comment, Integer sinks, Integer created) {

        long score = Math.max(loves - 1, 1) + favorites * 2 + comment * 2 - sinks;

        // 投票方向
        int sign = (score == 0) ? 0 : (score > 0 ? 1 : -1);

        // 帖子争议度
        double order = Math.log10(Math.max(Math.abs(score), 1));

        // 1459440000是项目创建时间
        double seconds = created - 1459440000;
        return Double.parseDouble(String.format("%.2f", order + sign * seconds / 45000));
    }

    public static String encrypt(String plainText, String encryptionKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
        return new BASE64Encoder().encode(encryptedBytes);
    }

    public static String decrypt(String cipherText, String encryptionKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        SecretKeySpec key = new SecretKeySpec(encryptionKey.getBytes("UTF-8"), "AES");
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] cipherTextBytes = new BASE64Decoder().decodeBuffer(cipherText);
        byte[] decValue = cipher.doFinal(cipherTextBytes);
        return new String(decValue);
    }

    private static final HashidKit topicId = new HashidKit("java-china-topicid");

    public static String genTopicID() {
        return topicId.encode(System.nanoTime()).toLowerCase();
    }

}
