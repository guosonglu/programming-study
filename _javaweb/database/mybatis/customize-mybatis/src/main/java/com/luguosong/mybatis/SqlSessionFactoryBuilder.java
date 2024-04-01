package com.luguosong.mybatis;

import java.io.InputStream;

/**
 * @author luguosong
 */
public class SqlSessionFactoryBuilder {
    public SqlSessionFactory build(InputStream stream) {
        return new SqlSessionFactory();
    }
}
