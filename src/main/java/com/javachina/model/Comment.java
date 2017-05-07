package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 用户评论对象
 */
@Table(name = "t_comments", pk = "cid")
@Data
@Builder
@NoArgsConstructor
public class Comment implements Serializable {

    private Integer cid;
    private Integer author_id;
    private Integer owner_id;
    private String tid;
    private String author;
    private String content;
    private String ip;
    private String agent;
    private String type;
    private Integer status;
    private Integer created;

}