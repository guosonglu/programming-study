package com.luguosong;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.dbcp2.BasicDataSourceFactory;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

/**
 * DBCP数据库连接池使用示例
 *
 * @author luguosong
 */
public class DBCPDemo {
    public static void main(String[] args) throws SQLException, IOException {
        /*
         * 方式一：手动设置数据库连接池
         * */
        //BasicDataSource dataSource = new BasicDataSource();
        //dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
        //dataSource.setUrl("jdbc:mysql://localhost:3306/learn_jdbc");
        //dataSource.setUsername("root");
        //dataSource.setPassword("12345678");

        /*
         * 方式二：通过配置文件获取数据库连接池
         * */
        //加载配置文件
        Properties pros = new Properties();
        InputStream is = ClassLoader.getSystemClassLoader().getResourceAsStream("dbcp.properties");
        pros.load(is);
        //通过配置文件创建数据库连接池
        BasicDataSource dataSource = BasicDataSourceFactory.createDataSource(pros);

        //手动设置相关参数
        dataSource.setInitialSize(10);

        Connection connection = dataSource.getConnection();
        System.out.println(connection);
        connection.close(); // 连接池中的连接关闭时，实际上并没有关闭，而是放回连接池中
        dataSource.close(); //关闭数据库连接池
    }
}
