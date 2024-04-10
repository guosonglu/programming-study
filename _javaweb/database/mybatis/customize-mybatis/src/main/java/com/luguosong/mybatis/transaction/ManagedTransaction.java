package com.luguosong.mybatis.transaction;

import java.sql.Connection;

/**
 * MANAGED事务管理器
 *
 * @author luguosong
 */
public class ManagedTransaction implements Transaction {
    @Override
    public void commit() {

    }

    @Override
    public void rollback() {

    }

    @Override
    public void close() {

    }

    @Override
    public void openConnection() {

    }

    @Override
    public Connection getConnection() {
        return null;
    }
}
