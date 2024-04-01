package com.luguosong;

import com.luguosong.pojo.Car;
import com.luguosong.util.SqlSessionUtil;
import org.apache.ibatis.session.SqlSession;

import java.util.List;

/**
 * @author luguosong
 */
public class MybatisCRUD {
    public static void main(String[] args) {
        SqlSession sqlSession = SqlSessionUtil.getSqlSession();

        /*
         * 增
         * 通过对象进行新增，符合ORM思想
         * */
        Car car = new Car(null, "1022", "奥迪", 1000000.0, "2019-01-01", "轿车");
        sqlSession.insert("crud.insertCar", car);
        sqlSession.commit();

        /*
         * 改
         * */
        car.setGuidePrice(2000000.0);
        sqlSession.update("crud.updateCar", car);
        sqlSession.commit();

        /*
         * 查
         * */
        //查询一条数据
        Car car1 = sqlSession.selectOne("crud.selectCarByCarNum", 100);
        System.out.println(car1);
        //查询所有数据
        List<Car> list = sqlSession.selectList("crud.selectAllCar");
        for (Car car2 : list) {
            System.out.println(car2);
        }

        /*
         * 删
         * */
        sqlSession.delete("crud.deleteCar", 1022);
        sqlSession.commit();

        sqlSession.close();
    }
}
