package com.luguosong;

import com.alibaba.druid.util.JdbcUtils;
import com.luguosong.bean.Customers;
import com.luguosong.util.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author luguosong
 */
public class DbutilsDemo {
    public static void main(String[] args) throws SQLException {
        Connection connection = JDBCUtil.getConnection();

        /*
         * 增
         * */
        // 自己实现
        String sql = "insert into customers(name,email,birth) values(?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setObject(1, "李四");
        statement.setObject(2, "lisi@163.com");
        statement.setObject(3, "1990-01-01");
        statement.execute();
        statement.close();
        // 使用Dbutils
        QueryRunner queryRunner = new QueryRunner();
        queryRunner.update(connection, sql, "王五", "wangwu@163.com", "1991-01-01");

        /*
        * 改
        * */
        // 自己实现
        String sql1 = "update customers set birth = ? where name = ?";
        PreparedStatement statement1 = connection.prepareStatement(sql1);
        statement1.setObject(1, "1990-01-02");
        statement1.setObject(2, "李四");
        statement1.execute();
        statement1.close();
        // 使用Dbutils
        queryRunner.update(connection, sql1, "1991-01-02", "王五");


        /*
         * 查
         * */
        // 自己实现
        String sql2 = "select id, name, email, birth from customers where name = ?";
        PreparedStatement statement2 = connection.prepareStatement(sql2);
        statement2.setObject(1, "李四");
        ResultSet resultSet = statement2.executeQuery();
        while (resultSet.next()) {
            System.out.print("id:" + resultSet.getObject("id"));
            System.out.print("  name:"+resultSet.getObject("name"));
            System.out.print("  email:"+resultSet.getObject("email"));
            System.out.println("  birth:"+resultSet.getObject("birth"));
        }
        resultSet.close();
        statement2.close();
        // 使用Dbutils
        Customers customers = queryRunner.query(connection, sql2, new BeanHandler<>(Customers.class), "王五");
        System.out.println(customers);


        /*
        * 删
        * */
        // 自己实现
        String sql3 = "delete from customers where name = ?";
        PreparedStatement statement3 = connection.prepareStatement(sql3);
        statement3.setObject(1, "李四");
        statement3.execute();
        statement3.close();
        // 使用Dbutils
        queryRunner.update(connection, sql3, "王五");


        //connection.close();
        JdbcUtils.close(connection);
    }
}
