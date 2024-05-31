package com.luguosong.ioc.hello;

/**
 * @author luguosong
 */
public class User {
    private String name;
    private Integer age;

    @Override
    public String toString() {
        return "User{" +
                "age=" + age +
                ", name='" + name + '\'' +
                '}';
    }
}
