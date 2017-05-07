package com.javachina.ext;

import com.blade.jdbc.model.PageRow;
import com.blade.jdbc.model.Paginator;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

/**
 * Created by biezhi on 2017/2/12.
 */
public class PageHelper {

    public static <T> Paginator<T> go(Sql2o sql2o, Class<T> type, String sql, PageRow pageRow, Object... params) {
        String countSql = getCountSql(sql);
        Paginator<T> paginator;
        try (Connection con = sql2o.open()) {

            sql = com.blade.jdbc.utils.Utils.getPageSql(sql, "mysql", pageRow);

            if (null != params && params.length > 0) {
                int total = con.createQuery(countSql).withParams(params).executeScalar(Integer.class);
                paginator = new Paginator<>(total, pageRow.getPage(), pageRow.getLimit());
                List<T> list = con.createQuery(sql).withParams(params).executeAndFetch(type);
                if (null != list) {
                    paginator.setList(list);
                }
            } else {
                int total = con.createQuery(countSql).executeScalar(Integer.class);
                paginator = new Paginator<>(total, pageRow.getPage(), pageRow.getLimit());
                List<T> list = con.createQuery(sql).executeAndFetch(type);
                if (null != list) {
                    paginator.setList(list);
                }
            }

        }
        return paginator;
    }

    private static String getCountSql(String sql) {
        sql = sql.toLowerCase();
        String csql = "select count(0)";
        csql += sql.substring(sql.indexOf(" from "), sql.lastIndexOf("order by"));
        return csql;
    }

    public static void main(String[] args) {
        System.out.println(getCountSql("select a, f, fad from bb"));
    }
}
