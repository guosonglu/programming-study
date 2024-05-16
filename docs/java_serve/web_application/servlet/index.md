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

## Servlet接口

```java
package jakarta.servlet;
import java.io.IOException;

/*
 * 定义所有 servlet 必须实现的方法。
 * Servlet 是在 Web 服务器中运行的小型 Java 程序。
 * Servlet 通常通过 HTTP（超文本传输协议）接收和响应网络客户端的请求。
 * */
public interface Servlet {
    /*
     * 由servlet容器(比如Tomcat)调用，用于向 servlet 指示该 servlet 正在投入服务。
     * 在实例化 servlet 后，servlet 容器会调用一次init方法。
     * */
    public void init(ServletConfig config) throws ServletException;

    /*
     * 返回ServletConfig对象，其中包含此 servlet 的初始化和启动参数。
     * 返回的ServletConfig对象就是传递给init方法的对象。
     * */
    public ServletConfig getServletConfig();

    /*
     * 由 servlet 容器调用，允许 servlet 响应请求。
     * 该方法只有在 servlet 的init()方法成功完成后才会被调用。
     * 
     * Servlet 通常在多线程 Servlet 容器中运行，可以同时处理多个请求。
     * 开发人员必须注意同步访问任何共享资源，如文件、网络连接以及 servlet 的类和实例变量。
     * 
     * req- 包含客户端请求的ServletRequest对象
     * res- 包含 Servlet 响应的ServletResponse对象
     * */
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException;

    /*
     * 返回有关 servlet 的信息，如作者、版本和版权。
     * 此方法返回的字符串应为纯文本，而非任何类型的标记（如 HTML、XML 等）
     * */
    public String getServletInfo();

    /*
     * 由 servlet 容器(如Tomcat)调用，用于向 servlet 指示该 servlet 即将退出服务。
     * 只有当 servlet服务方法中的所有线程都退出或超时后，才会调用此方法。
     * 在 servlet 容器调用此方法后，它不会再调用此 servlet 的service方法。
     *
     * 该方法让 servlet 有机会清理任何被占用的资源（如内存、文件句柄、线程），
     * 并确保任何持久化状态与 servlet 在内存中的当前状态同步。
     * */
    public void destroy();
}
```

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

## GenericServlet抽象类

### 概述

`GenericServlet抽象类`实现了`Servlet接口`除`service方法`外的其它方法。

`service方法`则设置为抽象方法，需要子类实现。

### 基于GenericServlet开发

- 编写Servlet类：

``` java
--8<-- "docs/java_serve/web_application/servlet/generic-servlet/src/main/java/org/example/genericservlet/HelloServlet.java"
```

- 编写web.xml映射：

``` xml
--8<-- "docs/java_serve/web_application/servlet/generic-servlet/src/main/webapp/WEB-INF/web.xml"
```

### 处理ServletConfig对象

Tomcat初始化时，会调用`init方法`，并传递`ServletConfig对象`给`init方法`。默认情况下`ServletConfig对象`只能在`init方法内部`调用。

```java
public class GenericServlet implements Servlet {
    @Override
    public void init(ServletConfig config) throws ServletException {

    }

    /*
     * ... 其它代码
     * */
}
```

如果想在`service方法`中访问`ServletConfig对象`，可以将ServletConfig这个`局部对象`传递给一个新建的ServletConfig`字段`。达到可以在Servlet对象任意位置访问ServletConfig对象的目的。

```java
public class GenericServlet implements Servlet {

    /*
     * 将Tomcat传递给init方法的ServletConfig对象升级为字段
     * 方便其它方法调用
     * */
    private ServletConfig config;

    @Override
    public void init(ServletConfig config) throws ServletException {
        this.config = config;
        this.init();
    }

    /*
     * 👍🏻该方法的作用是，防止子类重写init方法时，忘记执行 this.config = config;
     * 导致config为空
     * */
    public void init() throws ServletException {

    }

    @Override
    public ServletConfig getServletConfig() {
        return config;
    }

    @Override
    public void service(ServletRequest request, ServletResponse response) {
        // ⭐service方法中可以访问到Tomcat传递给init方法的ServletConfig对象
        System.out.println(config.getServletName());
    }

    /*
    * ... 其它方法
    * */
}
```

## ServletConfig对象

`ServletConfig对象`中包含了web.xml中配置的`<servlet>`标签信息。

`ServletConfig对象`有四个方法：

- `getServletName()`
- `getInitParameterNames()`
- `getInitParameter(String name)`
- `getServletContext()`

!!! note

    每个Servlet对应一个ServletConfig对象

```xml
<web-app>
    <servlet>
        <servlet-name>servletConfigDemo</servlet-name>
        <servlet-class>com.luguosong.ServletConfigDemo</servlet-class>
        <!--配置初始化信息-->
        <init-param>
            <param-name>user</param-name>
            <param-value>root</param-value>
        </init-param>
        <init-param>
            <param-name>password</param-name>
            <param-value>12345678</param-value>
        </init-param>
    </servlet>
</web-app>
```

``` java
--8<-- "docs/java_serve/web_application/servlet/servlet-config/src/main/java/com/luguosong/ServletConfigDemo.java"
```

`GenericServlet`已经封装了调用ServletConfig中`getServletName()`、`getServletName()`和`getServletName()`方法。因此可以直接调用，无需通过config进行调用：

``` java
--8<-- "docs/java_serve/web_application/servlet/servlet-config/src/main/java/com/luguosong/ServletConfigDemo2.java"
```

## ServletContext对象

`ServletContext对象`是一个`Servlet`与其`Servlet容器(Tomcat)`通信的一组方法，例如获取文件的MIME类型、分派请求或写入日志文件。

!!! note

    所有Servlet共享同一个`ServletContext对象`,一个web应用只有一个`ServletContext对象`

    `ServletContext对象`在服务器启动时创建。

!!! note "ServletContext对象常用方法有："

    - `getInitParameterNames()`,`getInitParameter()`:获取web.xml中的上下文初始化参数`<context-param>`
    - `getContextPath()`:获取应用根路径
    - `getRealPath()`:获取文件的绝对路径
    - `log()`：写入日志到log目录下的日志文件
    - `setAttribute()`、`getAttribute()`、`removeAttribute()`:操作`应用域`,应用域中的数据所有Servlet共享。

``` java
--8<-- "docs/java_serve/web_application/servlet/servlet-context/src/main/java/com/luguosong/ServletContextDemo.java"
```

## HttpServlet类

### 概述

### 模板方法设计模式
