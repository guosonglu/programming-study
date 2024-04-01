package com.luguosong.mybatis;

import javax.sql.DataSource;

/**
 * JDBC事务管理器
 *
 * @author luguosong
 */
public class JDBCTransaction implements Transaction {

    /*
    * 数据源
    * */
    private DataSource dataSource;

    //是否自动提交
    private boolean autoCommit;

    public JDBCTransaction(DataSource dataSource, boolean autoCommit) {
        this.dataSource = dataSource;
        this.autoCommit = autoCommit;
    }

    @Override
    public void commit() {

    }

    @Override
    public void rollback() {

    }

    @Override
    public void close() {

    }
}
