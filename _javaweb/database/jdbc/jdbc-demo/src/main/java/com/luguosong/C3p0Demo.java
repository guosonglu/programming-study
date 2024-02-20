package com.luguosong;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import java.beans.PropertyVetoException;
import java.sql.Connection;
import java.sql.SQLException;

/**
 * C3p0数据库连接池使用示例
 *
 * @author luguosong
 */
public class C3p0Demo {
    public static void main(String[] args) throws PropertyVetoException, SQLException, InterruptedException {

        /*
         * 会从c3p0-config.xml中自动读取配置
         * */
        ComboPooledDataSource cpds = new ComboPooledDataSource();
        //也可以手动设置连接参数
        //cpds.setDriverClass("com.mysql.jdbc.Driver");
        //cpds.setJdbcUrl("jdbc:mysql://localhost:3306/learn_jdbc");
        //cpds.setUser("root");
        //cpds.setPassword("12345678");


        //设置初始连接数
        cpds.setInitialPoolSize(3);

        Connection connection = cpds.getConnection();
        connection.close(); //回收连接
        cpds.close();
    }
}
