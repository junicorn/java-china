package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.BeanKit;
import com.blade.kit.DateKit;
import com.blade.kit.EncrypKit;
import com.blade.kit.StringKit;
import com.javachina.constants.Actions;
import com.javachina.dto.LoginUser;
import com.javachina.exception.TipException;
import com.javachina.ext.Funcs;
import com.javachina.kit.MailKit;
import com.javachina.model.Remind;
import com.javachina.model.User;
import com.javachina.model.UserInfo;
import com.javachina.service.*;
import com.vdurmont.emoji.EmojiParser;

import java.util.HashMap;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Inject
    private ActiveRecord activeRecord;

    @Inject
    private CodesService codesService;

    @Inject
    private TopicService topicService;

    @Inject
    private UserInfoService userInfoService;

    @Inject
    private CommentService commentService;

    @Override
    public User getUserById(Integer uid) {
        if (null == uid) {
            return null;
        }
        return activeRecord.byId(User.class, uid);
    }

    @Override
    public User getUserByTake(Take take) {
        if (null == take) {
            return null;
        }
        return activeRecord.one(take);
    }

    @Override
    public Paginator<User> getPageList(Take take) {
        if (null != take) {
            return activeRecord.page(take);
        }
        return null;
    }

    @Override
    public User signup(String username, String passWord, String email) throws Exception {
        if (StringKit.isBlank(username) || StringKit.isBlank(passWord) || StringKit.isBlank(email)) {
            return null;
        }

        if (hasUser(username)) {
            return null;
        }

        int time = DateKit.getCurrentUnixTime();
        String pwd = EncrypKit.md5(username + passWord);
        String avatar = "avatar/default/" + StringKit.getRandomNumber(1, 5) + ".png";

        try {

            User user = new User();
            user.setUsername(username);
            user.setPassword(pwd);
            user.setEmail(email);
            user.setAvatar(avatar);
            user.setStatus(0);
            user.setCreated(time);
            user.setUpdated(time);
            Long uid = activeRecord.insert(user);

            userInfoService.save(uid.intValue());

            // 发送邮件通知
            String code = codesService.save(user, Actions.SIGNUP);

            //  发送注册邮件
            MailKit.sendSignup(user.getUsername(), user.getEmail(), code);
            return user;
        } catch (Exception e) {
            throw e;
        }
    }

    @Override
    public boolean delete(Integer uid) {
        if (null != uid) {
            activeRecord.delete(User.class, uid);
            return true;
        }
        return false;
    }

    @Override
    public LoginUser signin(String username, String passWord) {
        if (StringKit.isBlank(username) || StringKit.isBlank(passWord)) {
            throw new TipException("用户名和密码不能为空");
        }

        boolean hasUser = this.hasUser(username);
        if (!hasUser) {
            throw new TipException("该用户不存在");
        }

        String pwd = EncrypKit.md5(username + passWord);

        Take take = new Take(User.class);
        take.eq("password", pwd)
                .in("status", 0, 1)
                .eq("username", username)
                .or("email", "=", username);

        User user = activeRecord.one(take);
        if (null == user) {
            throw new TipException("用户名或者密码错误");
        }

        if (user.getStatus() == 0) {
            throw new TipException("该用户尚未激活，请登录邮箱激活帐号后登录");
        }
        // 更新最后登录时间
        User temp = new User();
        temp.setUid(user.getUid());
        temp.setLastlogin(DateKit.getCurrentUnixTime());
        activeRecord.update(temp);
        return this.getLoginUser(user, null);
    }

    @Override
    public Map<String, Object> getUserDetail(Integer uid) {
        Map<String, Object> map = new HashMap<String, Object>();
        if (null != uid) {
            User user = activeRecord.byId(User.class, uid);
            UserInfo userInfo = activeRecord.byId(UserInfo.class, uid);
            map = BeanKit.beanToMap(userInfo);
            map.put("uid", uid);
            map.put("email", user.getEmail());
            map.put("avatar", user.getAvatar());
            if (StringKit.isNotBlank(userInfo.getInstructions())) {
                map.put("instructions", EmojiParser.parseToUnicode(userInfo.getInstructions()));
            }
            if (StringKit.isNotBlank(userInfo.getSignature())) {
                map.put("signature", EmojiParser.parseToUnicode(userInfo.getSignature()));
            }
            map.put("created", user.getCreated());
            String avatar = Funcs.avatar_url(user.getAvatar());
            map.put("avatar", avatar);
        }
        return map;
    }

    public boolean updateStatus(Integer uid, Integer status) {
        if (null != uid && null != status) {
            User temp = new User();
            temp.setUid(uid);
            temp.setStatus(status);
            activeRecord.update(temp);
        }
        return false;
    }

    @Override
    public boolean update(User user) {
        if (null != user && null != user.getUid()) {
            return activeRecord.update(user) > 0;
        }
        return false;
    }

    public boolean updatePwd(Integer uid, String newpwd) {
        try {
            if (null == uid || StringKit.isBlank(newpwd)) {
                return false;
            }
            User user = new User();
            user.setUid(uid);
            user.setPassword(newpwd);
            activeRecord.update(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public LoginUser getLoginUser(User user, Integer uid) {
        if (null == user) {
            user = this.getUserById(uid);
        }
        if (null != user) {
            LoginUser loginUser =
                    LoginUser.builder().uid(user.getUid())
                            .username(user.getUsername())
                            .password(user.getPassword())
                            .status(user.getStatus())
                            .role_id(user.getRole_id())
                            .avatar(user.getAvatar()).build();

            Integer comments = 1;//commentService.getComments(user.getUid());
            loginUser.setComments(comments);

            Integer topics = topicService.getTopics(user.getUid());
            loginUser.setTopics(topics);

//            Integer notices = eventService.getNotices(user.getUid());
//            loginUser.setNotices(notices);

            UserInfo userInfo = userInfoService.getUserInfoById(user.getUid());
            if (null != userInfo) {
                loginUser.setJobs(userInfo.getJobs());
                loginUser.setNickname(userInfo.getNick_name());
            }

            loginUser.setMy_topics(0);
            loginUser.setMy_nodes(0);
            loginUser.setFollowing(0);

            return loginUser;
        }
        return null;
    }

    @Override
    public boolean hasUser(String username) {
        if (StringKit.isNotBlank(username)) {
            Take take = new Take(User.class);
            take.in("status", 0, 1)
                    .eq("username", username)
                    .or("email", "=", username);

            return activeRecord.count(take) > 0;
        }
        return false;
    }

    @Override
    public User getUserByLoginName(String username) {
        if (StringKit.isNotBlank(username)) {
            Take take = new Take(User.class);
            take.in("status", 0, 1)
                    .eq("username", username)
                    .or("email", "=", username);

            return activeRecord.one(take);
        }
        return null;
    }

    public boolean updateRole(Integer uid, Integer role_id) {
        try {
            if (null == uid || null == role_id || role_id == 1) {
                return false;
            }
            User temp = new User();
            temp.setUid(uid);
            temp.setRole_id(role_id);
            activeRecord.update(temp);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Paginator<Remind> getReminds(Integer uid, int page, int limit) {
        return null;
    }

    @Override
    public Integer getNoReads(Integer uid) {
        return null;
    }
}
