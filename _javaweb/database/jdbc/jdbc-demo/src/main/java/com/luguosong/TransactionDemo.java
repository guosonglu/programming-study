package com.luguosong;

import com.luguosong.util.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * 演示事务
 *
 * @author luguosong
 */
public class TransactionDemo {
    public static void main(String[] args) throws SQLException {
        Connection connection = null;
        PreparedStatement statement1 = null;
        PreparedStatement statement2 = null;

        try {
            connection = JDBCUtil.getConnection();
            //1️⃣开启事务
            connection.setAutoCommit(false);

            statement1 = connection.prepareStatement("UPDATE user_table SET balance=? WHERE user='AA'");
            statement1.setInt(1, 900);
            statement1.executeUpdate();

            // Simulate an exception
            System.out.println(1 / 0);

            statement2 = connection.prepareStatement("UPDATE user_table SET balance=? WHERE user='BB'");
            statement2.setInt(1, 1100);
            statement2.executeUpdate();

            //2️⃣提交事务
            connection.commit();
            System.out.println("事务提交成功.");
        } catch (SQLException e) {
            try {
                //3️⃣回滚事务
                connection.rollback();
            } catch (SQLException rollbackEx) {
                System.err.println("Rollback failed: " + rollbackEx.getMessage());
            }
            System.err.println("Error occurred, rolling back transaction: " + e.getMessage());
        } finally {
            try {
                if (statement1 != null) {
                    statement1.close();
                }
                if (statement2 != null) {
                    statement2.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException closeEx) {
                System.err.println("Error closing resources: " + closeEx.getMessage());
            }
        }
    }
}
