package com.luguosong;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Properties;

/**
 * Druid连接池示例
 *
 * @author luguosong
 */
public class DruidDemo {
    public static void main(String[] args) throws Exception {

        /*
         * 方式一
         * */
        // 创建Druid连接池
        //DruidDataSource source = new DruidDataSource();
        //source.setDriverClassName("com.mysql.jdbc.Driver");
        //source.setUrl("jdbc:mysql://localhost:3306/learn_jdbc");
        //source.setUsername("root");
        //source.setPassword("12345678");

        /*
        * 方式二
        * */
        Properties properties = new Properties();
        InputStream is = ClassLoader.getSystemClassLoader().getResourceAsStream("druid.properties");
        properties.load(is);
        DataSource source = DruidDataSourceFactory.createDataSource(properties);

        Connection connection = source.getConnection();
        System.out.println(connection);
        connection.close();
    }
}
