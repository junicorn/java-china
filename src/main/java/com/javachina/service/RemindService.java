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
     * 读取uid的未读提醒
     *
     * @param uid
     * @return
     */
    Integer unreads(Integer uid);

    /**
     * 读取我的提醒
     *
     * @param uid
     * @param page
     * @param limit
     * @return
     */
    Paginator<Remind> getNotices(Integer uid, int page, int limit);

}
