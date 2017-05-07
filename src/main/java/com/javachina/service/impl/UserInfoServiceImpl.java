package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.blade.kit.StringKit;
import com.javachina.model.UserInfo;
import com.javachina.service.UserInfoService;
import com.vdurmont.emoji.EmojiParser;

import java.util.List;

@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Inject
    private ActiveRecord activeRecord;

    @Override
    public UserInfo getUserInfoById(Integer uid) {
        return activeRecord.byId(UserInfo.class, uid);
    }

    private List<UserInfo> getUserinfoList(Take queryParam) {
        if (null != queryParam) {
            return activeRecord.list(queryParam);
        }
        return null;
    }

    @Override
    public Paginator<UserInfo> getPageList(Take queryParam) {
        if (null != queryParam) {
            return activeRecord.page(queryParam);
        }
        return null;
    }

    @Override
    public boolean save(Integer uid) {
        if (null == uid) {
            return false;
        }
        try {
            UserInfo userInfo = new UserInfo();
            userInfo.setUid(uid);
            activeRecord.insert(userInfo);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void update(UserInfo userInfo) {
        if (null != userInfo && null != userInfo.getUid()) {
            if (StringKit.isNotBlank(userInfo.getJobs())) {
                userInfo.setJobs(EmojiParser.parseToAliases(userInfo.getJobs()));
            }
            if (StringKit.isNotBlank(userInfo.getGithub())) {
                userInfo.setGithub(EmojiParser.parseToAliases(userInfo.getGithub()));
            }
            if (StringKit.isNotBlank(userInfo.getInstructions())) {
                userInfo.setInstructions(EmojiParser.parseToAliases(userInfo.getInstructions()));
            }
            if (StringKit.isNotBlank(userInfo.getWeb_site())) {
                userInfo.setWeb_site(EmojiParser.parseToAliases(userInfo.getWeb_site()));
            }
            if (StringKit.isNotBlank(userInfo.getLocation())) {
                userInfo.setLocation(EmojiParser.parseToAliases(userInfo.getLocation()));
            }
            activeRecord.update(userInfo);
        }
    }

    @Override
    public boolean delete(Integer uid) {
        if (null != uid) {
            return activeRecord.delete(UserInfo.class, uid) > 0;
        }
        return false;
    }

}
