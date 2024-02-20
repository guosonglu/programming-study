package com.luguosong;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author luguosong
 */
public class RegisterDriverDemo {
    public static void main(String[] args) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException, IOException {
        //从配置文件中读取连接参数
        InputStream stream = RegisterDriverDemo.class.getClassLoader().getResourceAsStream("jdbc.properties");
        Properties prop = new Properties();
        prop.load(stream);

        /*
         * 1.注册驱动
         * */
        //方式一：为了更好的移植性，不建议采用com.mysql.jdbc.Driver()这种第三方API
        Driver driver1 = new com.mysql.jdbc.Driver();
        //方式二：采用反射的方式获取驱动对象
        Class<?> clazz = Class.forName("com.mysql.jdbc.Driver");
        Driver driver2 = (Driver) clazz.newInstance();
        //方式三：采用DriverManager注册驱动，之后直接使用DriverManager获取连接
        DriverManager.registerDriver(driver1);
        //方式四：DriverManager自动注册,只需要将mysql的实现加载进内存，DriverManager会自动注册驱动
        Class.forName("com.mysql.jdbc.Driver"); //mysql会自动注册驱动，这一步其实也可以省略
        //👍🏻方式五：采用配置文件的方式
        Class.forName(prop.getProperty("driver"));
    }
}
