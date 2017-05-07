package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.javachina.exception.TipException;
import com.javachina.kit.MailKit;
import com.javachina.model.Codes;
import com.javachina.model.User;
import com.javachina.service.CodesService;
import com.javachina.service.UserInfoService;
import com.javachina.service.UserService;

@Service
public class CodesServiceImpl implements CodesService {

    @Inject
    private ActiveRecord activeRecord;

    @Inject
    private UserService userService;

    @Inject
    private UserInfoService userInfoService;

    @Override
    public Codes getActivecode(String code) {
        if (StringKit.isBlank(code)) {
            return null;
        }
        Codes temp = new Codes();
        temp.setCode(code);
        return activeRecord.one(temp);
    }

    public Codes getActivecodeById(Integer id) {
        if (null == id) {
            return null;
        }
        return activeRecord.byId(Codes.class, id);
    }

    @Override
    public String save(User user, String type) {
        if (null == user || StringKit.isBlank(type)) {
            throw new TipException("用户信息为空或类型为空");
        }

        int time = DateKit.getCurrentUnixTime();
        int expires_time = time + 3600;
        String code = StringKit.getRandomChar(32);
        Codes codes = new Codes();
        codes.setUid(user.getUid());
        codes.setCode(code);
        codes.setType(type);
        codes.setExpired(expires_time);
        codes.setCreated(time);
        activeRecord.insert(codes);
        if (type.equals("forgot")) {
            MailKit.sendForgot(user.getUsername(), user.getEmail(), code);
        }
        return code;
    }

    @Override
    public boolean useCode(String code) {
        if (null == code) {
            throw new TipException("激活码为空");
        }
        activeRecord.execute("update t_activecode set is_use = 1 where code = '" + code + "'");
        return true;
    }

    @Override
    public boolean resend(Integer uid) {
        User user = userService.getUserById(uid);
        if (null == user) {
            throw new TipException("不存在该用户");
        }

        int time = DateKit.getCurrentUnixTime();
        int expires_time = time + 3600;
        String code = StringKit.getRandomChar(32);

        Codes codes = new Codes();
        codes.setUid(user.getUid());
        codes.setCode(code);
        codes.setType("signup");
        codes.setExpired(expires_time);
        codes.setCreated(time);

        activeRecord.insert(codes);
        MailKit.sendSignup(user.getUsername(), user.getEmail(), code);
        return true;
    }

}
