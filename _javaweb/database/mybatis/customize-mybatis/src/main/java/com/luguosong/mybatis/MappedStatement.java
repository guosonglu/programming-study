package com.luguosong.mybatis;

/**
 * @author luguosong
 */
public class MappedStatement {
    private  String sql;

    private String resultType;


    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    public String getResultType() {
        return resultType;
    }

    public void setResultType(String resultType) {
        this.resultType = resultType;
    }
}
