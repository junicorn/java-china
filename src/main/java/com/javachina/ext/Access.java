package com.javachina.ext;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 方法的访问权限
 *
 * @author biezhi
 *         2017/5/7
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface Access {

    /**
     * 访问授权
     *
     * @return
     */
    AccessLevel level() default AccessLevel.LOGIN;

}
