package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Userinfo对象
 */
@Table(name = "t_userinfo", pk = "uid")
@Data
@NoArgsConstructor
public class UserInfo implements Serializable {

    private Integer uid;
    private String nick_name;
    private String jobs;
    private String web_site;
    private String location;
    private String github;
    private String weibo;
    private String signature;
    private String instructions;

}