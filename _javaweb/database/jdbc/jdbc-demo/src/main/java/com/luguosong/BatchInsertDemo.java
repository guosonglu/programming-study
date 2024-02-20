package com.luguosong;

import com.luguosong.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * @author luguosong
 */
public class BatchInsertDemo {
    public static void main(String[] args) throws SQLException {
        Connection connection = JDBCUtil.getConnection();
        PreparedStatement statement = connection.prepareStatement("insert into user (name, password) values (?, ?)");

        /*
         * 不使用批处理
         * */
        long start = System.currentTimeMillis();
        for (int i = 0; i < 1000; i++) {
            statement.setString(1, "lgs1" + i);
            statement.setString(2, "12345678");
            statement.execute();
        }
        long end = System.currentTimeMillis();
        System.out.println("优化前耗时：" + (end - start) + "ms");

        /*
         * 使用Batch进行批处理
         * */
        start = System.currentTimeMillis();
        //⭐设置不自动提交也可以增加效率
        connection.setAutoCommit(false);
        for (int i = 0; i < 1000; i++) {
            statement.setString(1, "lgs2" + i);
            statement.setString(2, "12345678");
            //⭐添加到批处理
            statement.addBatch();
            if (i % 500 == 0) {
                statement.executeBatch();
                statement.clearBatch();
            }
        }
        statement.executeBatch();
        connection.commit();
        end = System.currentTimeMillis();
        System.out.println("优化后耗时：" + (end - start) + "ms");

        //清除测试数据
        statement.execute("delete from user where name like 'lgs%'");
        statement.close();
        connection.close();
    }
}
