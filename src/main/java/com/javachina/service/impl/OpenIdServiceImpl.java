package com.javachina.service.impl;

import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.kit.DateKit;
import com.blade.kit.StringKit;
import com.javachina.model.Openid;
import com.javachina.service.OpenIdService;

@Service
public class OpenIdServiceImpl implements OpenIdService {

    @Inject
    private ActiveRecord activeRecord;

    @Override
    public Openid getOpenid(String type, Integer open_id) {
        if (null == open_id || StringKit.isBlank(type)) {
            return null;
        }
        Openid openid = new Openid();
        openid.setOpen_id(open_id);
        openid.setType(type);

        return activeRecord.one(openid);
    }

    @Override
    public boolean save(String type, Integer open_id, Integer uid) {
        if (StringKit.isNotBlank(type) && null != open_id && null != uid) {
            try {
                Openid openid = new Openid();
                openid.setType(type);
                openid.setOpen_id(open_id);
                openid.setUid(uid);
                openid.setCreated(DateKit.getCurrentUnixTime());
                activeRecord.insert(openid);
                return true;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    @Override
    public boolean delete(String type, Integer open_id) {
        if (null != open_id && StringKit.isNotBlank(type)) {
            Openid openid = new Openid();
            openid.setOpen_id(open_id);
            openid.setType(type);
            return activeRecord.delete(openid) > 0;
        }
        return false;
    }

}
