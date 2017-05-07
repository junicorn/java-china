package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

//
@Table(name = "t_openid", pk = "id")
@Data
@NoArgsConstructor
public class Openid implements Serializable {

    private Integer id;
    private String type;
    private Integer open_id;
    private Integer uid;
    private Integer created;

}