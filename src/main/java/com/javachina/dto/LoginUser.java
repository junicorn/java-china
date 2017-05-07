package com.javachina.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LoginUser {

    private Integer uid;
    private String username;
    private String nickname;
    private String password;
    private String jobs;
    private String avatar;
    private int role_id;
    private int status;
    private long topics;
    private long comments;
    private long notices;
    // 我收藏的帖子数
    private long my_topics;
    // 我收藏的节点数
    private long my_nodes;
    // 我关注的用户数
    private long following;

}
