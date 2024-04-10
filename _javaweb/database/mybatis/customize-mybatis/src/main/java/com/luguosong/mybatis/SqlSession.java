package com.luguosong.mybatis;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * 负责执行sql语句的对象
 *
 * @author luguosong
 */
public class SqlSession {
    private SqlSessionFactory sqlSessionFactory;

    public SqlSession(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    public int insert(String sqlId, Object pojo) {
        try {
            Connection connection = sqlSessionFactory.getTransaction().getConnection();

            String sql = sqlSessionFactory.getMappedStatementMap().get(sqlId).getSql();
            sql = sql.replaceAll("#\\{a-zA-Z0-9_$}*", "?");
            PreparedStatement ps = connection.prepareStatement(sql);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
