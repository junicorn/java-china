package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Settings对象
 */
@Table(name = "t_remind", pk = "id")
@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Remind implements Serializable {

    private Integer id;
    private String from_user;
    private Integer to_uid;
    private String event_id;
    private String title;
    private String content;
    private String remind_type;
    private Boolean is_read;
    private Integer created;

}