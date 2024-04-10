package com.luguosong.mybatis;

import com.luguosong.mybatis.transaction.Transaction;

import java.util.Map;

/**
 * @author luguosong
 */
public class SqlSessionFactory {

    /**
     * 事务管理器接口
     */
    private Transaction transaction;

    /**
     * 存储sql语句的Map集合
     */
    private Map<String, MappedStatement> mappedStatementMap;

    /**
     * 构造方法
     * @param transaction
     * @param mappedStatementMap
     */
    public SqlSessionFactory(Transaction transaction, Map<String, MappedStatement> mappedStatementMap) {
        this.transaction = transaction;
        this.mappedStatementMap = mappedStatementMap;
    }

    public SqlSession openSession() {

        return null;
    }

    public Transaction getTransaction() {
        return transaction;
    }

    public void setTransaction(Transaction transaction) {
        this.transaction = transaction;
    }

    public Map<String, MappedStatement> getMappedStatementMap() {
        return mappedStatementMap;
    }

    public void setMappedStatementMap(Map<String, MappedStatement> mappedStatementMap) {
        this.mappedStatementMap = mappedStatementMap;
    }

    @Override
    public String toString() {
        return "SqlSessionFactory{" +
                "transaction=" + transaction +
                ", mappedStatementMap=" + mappedStatementMap +
                '}';
    }
}
