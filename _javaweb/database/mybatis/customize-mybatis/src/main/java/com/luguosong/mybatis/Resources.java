package com.luguosong.mybatis;

import java.io.InputStream;

/**
 * 用于加载类路径资源
 *
 * @author luguosong
 */
public class Resources {
    //工具类的构造方法私有化，防止用户创建对象
    private Resources() {
    }

    //根据传入的参数，获取一个类路径下的资源文件的输入流
    public static InputStream getResourceAsStream(String path) {
        return ClassLoader.getSystemClassLoader().getResourceAsStream(path);
    }
}
