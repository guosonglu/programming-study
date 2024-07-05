package com.luguosong;

import com.luguosong.mapper.CarMapper;
import com.luguosong.pojo.Car;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * @author luguosong
 */
public class MyBatisTest {
    public static void main(String[] args) throws IOException {
        InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
        SqlSessionFactory sqlSessionFactory = builder.build(is);
        //表示Java程序和数据库之间的会话
        SqlSession sqlSession = sqlSessionFactory.openSession();
        // 获取Mapper接口的实现类对象
        CarMapper carMapper = sqlSession.getMapper(CarMapper.class);
        Car car = carMapper.selectCarById(1);
        System.out.println(car);
    }
}
