package com.luguosong;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * 获取连接
 *
 * @author luguosong
 */
public class GetConnectionDemo {

    public static void main(String[] args) throws IOException, ClassNotFoundException, SQLException {

        //从配置文件中读取连接参数
        InputStream stream = GetConnectionDemo.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties prop = new Properties();
        prop.load(stream);
        String propUrl = prop.getProperty("url");
        String propUser = prop.getProperty("user");
        String propPassword = prop.getProperty("password");
        String propDriver = prop.getProperty("driver");


        //方案一:获取驱动对象
        Driver driver = new com.mysql.jdbc.Driver();
        //方案二：注册驱动
        Class.forName(propDriver);


        //方式一：采用Driver获取连接
        String url = "jdbc:mysql://localhost:3306/learn_jdbc";
        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "12345678");
        Connection connection1 = driver.connect(url, properties);
        System.out.println(connection1);
        connection1.close();

        //方式二：采用DriverManager获取连接
        Connection connection2 = DriverManager.getConnection(url, "root", "12345678");
        System.out.println(connection2);
        connection2.close();

        //👍🏻方式三：从配置文件读取连接参数
        Connection connection3 = DriverManager.getConnection(propUrl, propUser, propPassword);
        System.out.println(connection3);
        connection3.close();
    }
}
