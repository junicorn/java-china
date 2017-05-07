package com.javachina.dto;

import com.blade.kit.StringKit;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Created by biezhi on 2017/2/12.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class HomeTopic implements Serializable {

    private String tid;
    private String username;
    private String avatar;
    private String title;
    private Integer created;
    private Integer updated;
    private String node_title;
    private String node_slug;
    private int comments;

}
