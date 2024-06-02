package com.luguosong.ioc.hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 使用set方法进行依赖注入
 *
 * @author luguosong
 */
public class IocSetterTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("ioc_set.xml");
        UserService userService = context.getBean("userService", UserService.class);
        userService.test();
    }
}
