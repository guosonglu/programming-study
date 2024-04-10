package com.luguosong.mybatis.transaction;

import java.sql.Connection;

/**
 * 事务管理器接口
 *
 * @author luguosong
 */
public interface Transaction {
    /**
     * 提交事务
     */
    void commit();

    /**
     * 回滚事务
     */
    void rollback();

    /**
     * 关闭连接
     */
    void close();

    /**
     * 打开连接
     */
    void openConnection();

    /**
     * 获取连接
     */
    Connection getConnection();
}
