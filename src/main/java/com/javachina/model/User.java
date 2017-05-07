package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * User对象
 */
@Table(name = "t_user", pk = "uid")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User implements Serializable {

    /**
     * 用户唯一标识，uuid
     */
    private Integer uid;

    /**
     * 用户登录名
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 用户头像
     */
    private String avatar;

    /**
     * 电子邮箱
     */
    private String email;

    /**
     * 注册时间
     */
    private Integer created;

    /**
     * 最后一次登录时间
     */
    private Integer lastlogin;

    /**
     * 最后一次操作时间
     */
    private Integer updated;

    /**
     * 5:普通用户 2:管理员 1:系统管理员
     */
    private Integer role_id;

    /**
     * 0:待激活 1:正常 2：删除
     */
    private Integer status;

}