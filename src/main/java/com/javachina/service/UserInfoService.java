package com.javachina.service;

import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.javachina.model.UserInfo;

public interface UserInfoService {

    /**
     * 根据uid获取用户详细信息
     *
     * @param uid
     * @return
     */
    UserInfo getUserInfoById(Integer uid);

    /**
     * 分页获取用户信息
     *
     * @param take
     * @return
     */
    Paginator<UserInfo> getPageList(Take take);

    /**
     * 根据uid保存一条用户信息
     *
     * @param uid
     * @return
     */
    boolean save(Integer uid);

    /**
     * 更新用户信息
     *
     * @param userInfo
     */
    void update(UserInfo userInfo);

    /**
     * 删除用户信息
     *
     * @param uid
     * @return
     */
    boolean delete(Integer uid);

}
