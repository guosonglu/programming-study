package com.luguosong.util;

import com.luguosong.RegisterDriverDemo;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author luguosong
 */
public class JDBCUtil {

    private static String url = "jdbc:mysql://localhost:3306/learn_jdbc?rewriteBatchedStatements=true";
    private static String user = "root";
    private static String password = "12345678";


    {
        try {
            InputStream stream = RegisterDriverDemo.class.getClassLoader().getResourceAsStream("jdbc.properties");
            Properties prop = new Properties();
            prop.load(stream);
            user = prop.getProperty("user");
            password = prop.getProperty("password");
            url = prop.getProperty("url");

            //注册驱动
            Class.forName(prop.getProperty("driver"));
        } catch (IOException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取连接对象
     *
     * @return
     */
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(url, user, password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
