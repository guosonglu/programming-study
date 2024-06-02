package com.luguosong.ioc.hello;

/**
 * @author luguosong
 */
public class User {
    private String name;
    private Integer age;

    public User() {

    }

    public User(Integer age, String name) {
        this.age = age;
        this.name = name;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "User{" +
                "age=" + age +
                ", name='" + name + '\'' +
                '}';
    }
}
