package com.javachina.service;

import com.blade.jdbc.core.Take;
import com.blade.jdbc.model.Paginator;
import com.javachina.dto.LoginUser;
import com.javachina.model.Remind;
import com.javachina.model.User;

import java.util.Map;

public interface UserService {

    User getUserById(Integer uid);

    User getUserByTake(Take take);

    User getUserByLoginName(String user_name);

    Map<String, Object> getUserDetail(Integer uid);

    Paginator<User> getPageList(Take take);

    User signup(String username, String passWord, String email) throws Exception;

    LoginUser signin(String username, String passWord);

    LoginUser getLoginUser(User user, Integer uid);

    boolean hasUser(String username);

    boolean delete(Integer uid);

    boolean update(User user);

    /**
     * 查询用户未读提醒数
     *
     * @param uid
     * @return
     */
    Integer getNoReads(Integer uid);

    /**
     * 分页查询用户提醒
     *
     * @param uid
     * @param page
     * @param limit
     * @return
     */
    Paginator<Remind> getReminds(Integer uid, int page, int limit);

}
