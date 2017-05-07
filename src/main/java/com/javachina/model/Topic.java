package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Topic对象
 */
@Table(name = "t_topic", pk = "tid")
@Data
@NoArgsConstructor
public class Topic implements Serializable {

    private static final long serialVersionUID = 1L;

    private String tid;

    //发布人
    private Integer uid;

    //所属节点
    private Integer nid;

    //帖子标题
    private String title;

    //帖子内容
    private String content;

    //是否置顶
    private Integer is_top;

    //是否是精华贴
    private Integer is_essence;

    // 帖子权重
    private Double weight;

    private Integer views;
    private Integer loves;
    private Integer favorites;
    private Integer comments;
    private Integer sinks;

    //帖子创建时间
    private Integer created;

    //最后更新时间
    private Integer updated;

    //1:正常 2:删除
    private Integer status;

}