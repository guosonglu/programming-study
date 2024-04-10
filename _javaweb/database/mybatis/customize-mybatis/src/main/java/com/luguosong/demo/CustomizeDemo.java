package com.luguosong.demo;

import com.luguosong.mybatis.SqlSessionFactory;
import com.luguosong.mybatis.SqlSessionFactoryBuilder;

/**
 * @author luguosong
 */
public class CustomizeDemo {
    public static void main(String[] args) {
        SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
        SqlSessionFactory build = sqlSessionFactoryBuilder.build(ClassLoader.getSystemResourceAsStream("mybatis-config.xml"));
        System.out.println(build);

    }
}
