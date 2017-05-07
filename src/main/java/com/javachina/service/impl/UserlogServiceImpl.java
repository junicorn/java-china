package com.javachina.service.impl;

import com.blade.context.WebContextHolder;
import com.blade.ioc.annotation.Inject;
import com.blade.ioc.annotation.Service;
import com.blade.jdbc.ActiveRecord;
import com.blade.kit.DateKit;
import com.javachina.kit.Utils;
import com.javachina.model.Userlog;
import com.javachina.service.UserlogService;

@Service
public class UserlogServiceImpl implements UserlogService {

    @Inject
    private ActiveRecord activeRecord;

    @Override
    public void save(Userlog userlog) {
        final String ip = Utils.getIpAddr(WebContextHolder.me().request());
        Utils.run(() -> {
            userlog.setIp(ip);
            userlog.setCreated(DateKit.getCurrentUnixTime());
            activeRecord.insert(userlog);
        });
    }

}