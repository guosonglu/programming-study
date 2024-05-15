# Servlet

## 动态网页

动态网页是说页面中的数据是变化的，根据数据库的变化而变化。

## Servlet概述

`Servlet规范`是指Java语言实现的一个`接口`。该接口定义了生命周期方法。

`Servlet`是指任何实现了这个`Servlet接口`的类。

Servlet没有main方法，不能独立运行，它必须被部署到`Servlet容器`
中。Servlet容器也叫做Servlet引擎，是Web服务器或应用程序服务器的一部分，用于在发送的请求和响应之上提供网络服务。`Tomcat`
就是一个免费的开放源代码的`Servlet容器`。

Tomcat服务器接受客户请求并做出响应的过程如下:

1. `客户端`（通常都是浏览器）访问Web服务器，发送HTTP请求。
2. `Web服务器`(Tomcat)接收到客户端的 HTTP 请求。
3. `Servlet 容器`（Tomcat）根据请求的 URL 和配置信息来确定是否需要加载相应的`Servlet类`(我们应用编写的Servlet类)，并生成
   Servlet 实例。如果需要加载，容器会创建 Servlet 实例，并调用其 `init()` 方法进行初始化。
4. Servlet实例使用`请求对象`得到客户端的请求信息，然后进行相应的处理。
5. Servlet实例将处理结果通过`响应对象`发送回客户端，`容器`负责确保响应正确送出。

## 版本问题

Tomcat 10(对应`Jakarta EE 9`)及其以后版本的用户应该注意，由于将Java EE从Oracle转移到Eclipse基金会并改名为Jakarta
EE(`Jakarta EE 9开始`)，所有已实现API的主要包都从`javax.*`变更为`jakarta.*`。这几乎肯定需要对应用程序进行代码更改，以便将其从Tomcat
9及更早版本迁移到Tomcat 10及以后版本。

| JavaEE版本      | JDK版本                                        | Servlet版本 | Tomcat版本 | JSP版本 | Spring版本          |
|---------------|----------------------------------------------|-----------|----------|-------|-------------------|
| JAVA EE 1.2   | 1.1 and later                                | 2.2       | 3.3.x    | 1.1   |                   |
| JAVA EE 1.3   | 1.3 and later                                | 2.3       | 4.1.x    | 1.2   |                   |
| JAVA EE 1.4   | 1.4 and later                                | 2.4       | 5.5.x    | 2.0   |                   |
| JAVA EE 5     | 5 and later                                  | 2.5       | 6.0.x    | 2.1   |                   |
| JAVA EE 6     | 6 and later<br/>(7 and later for WebSocket)	 | 3.0       | 7.0.x    | 2.2   |                   |
| JAVA EE 7     | 7 and later                                  | 3.1       | 8.0.x    | 2.3   | 5.3.x             |
| JAVA EE 7     | 7 and later                                  | 3.1       | 8.5.x    | 2.3   | 5.3.x             |
| JAVA EE 8     | 8 and later                                  | 4.0       | 9.0.x    | 2.3   | 5.3.x             |
| Jakarta EE 9  | 8 and later                                  | 5.0       | 10.0.x   | 3.0   | 6.0.x、6.1.x       |
| Jakarta EE 10 | 11 and later                                 | 6.0       | 10.1.x   | 3.1   | 6.0.x、6.1.x       |
| Jakarta EE 11 | 17 and later                                 | 6.1       | 11.0.x   | 4.0   | 6.0.x、6.1.x、6.2.x |

## Servlet目录规范

- `Web应用目录`
    - html、css、js、image等公共资源。
    - `WEB-INF目录`:存放Java类和配置文件
        - `classes目录`:存放Java类,比如`Servlet类`
        - `lib目录`:存放类库（第三方jar包），比如`JDBC驱动`等等
        - `web.xml`:配置文件。配置`请求路径`与`Servlet类`的映射关系。

## Hello World

- 使用IDEA创建项目：

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405141449467.png){ loading=lazy }
  <figcaption>创建项目</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405141509004.png){ loading=lazy }
  <figcaption>编译时，会在webapp/WEB-INF目录下生成classes目录，并将编译后的class文件放入其中</figcaption>
</figure>

- 编写Servlet

``` java
--8<-- "docs/java_serve/web_application/servlet/hello-servlet/src/main/java/com/luguosong/HelloServlet.java"
```

- 编写web.xml映射：

``` xml
--8<-- "docs/java_serve/web_application/servlet/hello-servlet/src/main/webapp/WEB-INF/web.xml"
```

- IDEA中配置Tomcat

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405141548170.png){ loading=lazy }
  <figcaption>配置Tomcat</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405141548100.png){ loading=lazy }
  <figcaption>配置工件</figcaption>
</figure>

- 启动项目，成功访问Servlet

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405141532109.png){ loading=lazy }
  <figcaption>访问Servlet</figcaption>
</figure>

## Servlet生命周期

Servlet的生命周期完全由Tomcat服务器控制。

- 默认情况下，Tomcat服务启动不会创建Servlet对象。

??? 通过配置让Tomcat在启动时创建对象

    ```xml
    <web-app>
        <servlet>
            <servlet-name>hello</servlet-name>
            <servlet-class>com.luguosong.HelloServlet</servlet-class>
            <!--设置Servlet在启动时创建对象-->
            <load-on-startup>0</load-on-startup>
        </servlet>
        <servlet-mapping>
            <servlet-name>hello</servlet-name>
            <url-pattern>/hello</url-pattern>
        </servlet-mapping>
    </web-app>
    ```

- 第一次访问Servlet时，Tomcat会创建Servlet对象，依次调用Servlet`无参构造方法`、`init()初始化方法`、`service()业务方法`。
- 之后再访问Servlet时，Tomcat只会调用对应Servlet`service()业务方法`。
- Tomcat服务器关闭时，会调用Servlet`destroy()销毁方法`（此时对象还并未销毁）。
