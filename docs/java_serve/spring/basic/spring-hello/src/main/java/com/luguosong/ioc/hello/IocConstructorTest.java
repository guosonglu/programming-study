package com.luguosong.ioc.hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 使用构造方法进行依赖注入
 *
 * @author luguosong
 */
public class IocConstructorTest {
    public static void main(String[] args) {
        ApplicationContext context = new ClassPathXmlApplicationContext("ioc_constructor.xml");
        UserService userService = context.getBean("userService", UserService.class);
        userService.test();
    }
}
