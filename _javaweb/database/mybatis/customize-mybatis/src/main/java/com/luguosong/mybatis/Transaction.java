package com.luguosong.mybatis;

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
}
