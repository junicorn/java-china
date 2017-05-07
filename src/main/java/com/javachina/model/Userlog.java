package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Userlog对象
 */
@Table(name = "t_userlog", pk = "id")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Userlog implements Serializable {

    private Integer id;
    private Integer uid;
    private String action;
    private String content;
    private String ip;
    private String agent;
    private Integer created;

}