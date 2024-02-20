package com.luguosong;

import com.luguosong.util.JDBCUtil;

import java.sql.Connection;
import java.sql.SQLException;

/**
 * 隔离级别相关示例
 *
 * @author luguosong
 */
public class TransactionIsolationDemo {
    public static void main(String[] args) throws SQLException {
        Connection connection = JDBCUtil.getConnection();
        /*
        * 1：读未提交（Read Uncommitted）
        * 2：读已提交（Read Committed）
        * 4：可重复读（Repeatable Read）
        * 8：串行化（Serializable）
        * */
        System.out.println("当前连接的隔离级别："+connection.getTransactionIsolation());

        //设置隔离级别
        connection.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
    }
}
