package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Activecode对象
 */
@Table(name = "t_codes")
@Data
@NoArgsConstructor
public class Codes implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer id;

    private Integer uid;

    private String code;

    private String type;

    private Integer is_use;

    //过期时间
    private Integer expired;

    //创建时间
    private Integer created;

}