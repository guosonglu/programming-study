package com.luguosong;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author luguosong
 */
public class MyBatisHello {
    public static void main(String[] args) {
        SqlSession sqlSession = null;
        try {
            //创建SqlSessionFactoryBuilder对象
            SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();

            //mybatis提供的Resources类，可以将配置文件加载成流
            InputStream stream = Resources.getResourceAsStream("mybatis-config.xml");
            //InputStream stream =ClassLoader.getSystemClassLoader().getResourceAsStream("mybatis-config.xml"); //等价

            //创建SqlSessionFactory对象
            SqlSessionFactory sessionFactory = builder.build(stream);
            //可以手动指定环境，不指定使用默认环境
            //SqlSessionFactory sessionFactory = builder.build(stream,"development");

            //创建SqlSession对象
            sqlSession = sessionFactory.openSession();
            //当openSession()方法传入true时，表示关闭事务，不需要手动提交
            //SqlSession sqlSession = sessionFactory.openSession(true);

            //执行sql语句
            sqlSession.insert("hello.insertCar");

            //提交事务
            sqlSession.commit();
        } catch (IOException e) {
            if (sqlSession != null)
                sqlSession.rollback();
            throw new RuntimeException(e);
        } finally {
            //关闭会话，释放资源
            if (sqlSession != null)
                sqlSession.close();
        }
    }
}
