package com.luguosong.mybatis;

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

}
