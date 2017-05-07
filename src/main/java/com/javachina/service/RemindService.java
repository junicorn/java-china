package com.javachina.service;

import com.blade.jdbc.model.Paginator;
import com.javachina.model.Remind;

/**
 * @author biezhi
 *         2017/5/2
 */
public interface RemindService {

    /**
     * 保存一条提醒
     *
     * @param remind
     */
    void saveRemind(Remind remind);

    /**
     * 分页读取我的提醒
     *
     * @param username
     * @param page
     * @param limit
     * @return
     */
    Paginator<Remind> getReminds(String username, int page, int limit);

    void readReminds(String username);
}
