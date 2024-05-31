package com.luguosong.ioc.hello;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @author luguosong
 */
public class SpringHello {
    public static void main(String[] args) {
        /*
         * 启动Spring容器
         * 解析xml文件
         * 实例化所有Bean对象，放入Spring容器中
         * */
        ApplicationContext context = new ClassPathXmlApplicationContext("spring_config_hello.xml");

        /*
         * 根据bean的id获取对应bean的实例
         * */
        Object userBean = context.getBean("userBean");

        System.out.println(userBean); //User{age=null, name='null'}
    }
}
