package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * @author biezhi
 *         2017/5/2
 */
@Table(name = "t_favorite")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Favorite implements Serializable {

    private Integer id;
    private Integer uid;
    private String event_id;
    private String event_type;
    private String favorite_type;
    private Integer created;

}
