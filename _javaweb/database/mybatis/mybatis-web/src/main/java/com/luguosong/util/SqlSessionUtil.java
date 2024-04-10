package com.luguosong.util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.InputStream;

/**
 * SqlSession工具类
 *
 * @author luguosong
 */
public class SqlSessionUtil {
    private static SqlSessionFactory sessionFactory;

    static {
        try {
            //创建SqlSessionFactoryBuilder对象
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

            //mybatis提供的Resources类，可以将配置文件加载成流
            InputStream stream = Resources.getResourceAsStream("mybatis-config.xml");
            //InputStream stream =ClassLoader.getSystemClassLoader().getResourceAsStream("mybatis-config.xml"); //等价

            //创建SqlSessionFactory对象
            sessionFactory = builder.build(stream);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static SqlSession getSqlSession() {
        return sessionFactory.openSession();
    }
}
