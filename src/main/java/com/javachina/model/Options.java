package com.javachina.model;

import com.blade.jdbc.annotation.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * Settings对象
 */
@Table(name = "t_options", pk = "skey")
@Data
@NoArgsConstructor
public class Options implements Serializable {

    private String skey;
    private String svalue;

}