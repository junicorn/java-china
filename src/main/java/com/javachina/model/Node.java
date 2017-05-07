package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Node对象
 */
@Table(name = "t_node", pk = "nid")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Node implements Serializable {

    private Integer nid;
    private Integer pid;
    private String title;
    private String description;
    private String slug;
    private String thumb_img;
    private Integer topics;
    private Integer created;
    private Integer updated;
    private Integer status;

}