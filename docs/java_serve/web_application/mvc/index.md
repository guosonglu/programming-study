# MVC架构模式

## 不使用MVC模式存在的问题

- 不使用MVC模式，Servlet需要负责`数据接收`、`核心业务逻辑处理`、`数据库连接和增删改查操作`、`页面展示`等功能。职责过重。
- 代码的`复用性差`，相同的业务操作或数据库操作，需要在不同Servlet中编写重复代码，不方便维护。
- 代码`耦合度高`，导致代码很难扩展。
- 操作数据库的代码和处理业务逻辑的代码混杂在一起，很容易出错，无法专注于业务逻辑的编写。

## MVC模式概述

- `M(Model、模型)`:用于处理业务
- `V(View、视图)`:负责页面展示
- `C(Controller、控制器)`:控制器是MVC架构的核心，

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/web_application/mvc/MVC%E6%9E%B6%E6%9E%84%E6%A8%A1%E5%BC%8F.svg){ loading=lazy }
  <figcaption>MVC架构图解</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202406201047597.png){ loading=lazy }
  <figcaption>MVC请求响应过程</figcaption>
</figure>

!!! note "DAO(Data Access Object、数据访问对象)"

    属于JavaEE的设计模式之一。只负责数据库的增删改查，没有任何业务逻辑在里面

## 三层架构

- `表示层`：Controller控制器+View视图
- `业务逻辑层`：Service服务
- `持久化层`：DAO数据访问对象

## Spring MVC概述

`Spring MVC`是`Spring Framework`框架的子模块

`Spring MVC`是实现`MVC架构模式`的Web框架。底层使用`Servlet`实现。

!!! note "Spring MVC能干什么"

    - 入口控制：通过`DispatcherServlet`作为入口控制器负责接收请求和分发请求。
    - 自动将表单请求参数封装为JavaBean对象
    - 统一使用IOC容器管理对象
    - 统一请求处理：提供拦截器、统一异常处理等机制
    - 视图解析：轻松切换JSP、Freemarker、Velocity等视图模板
    - 对Controller进行单元测试时，不依赖Tomcat Web服务器

## Spring MVC功能

与直接使用Servlet进行开发，Spring MVC提供了以下功能：

- `入口控制`：Servlet开发中，每个Servlet都需要在web.xml中进行配置，Spring MVC通过`DispatcherServlet`作为入口控制器负责统一接收请求和分发请求。
- Spring MVC会自动将表单数据封装为JavaBean对象,而不需要手动通过request对象获取表单数据。
- Spring MVC通过IOC容器管理对象，不需要手动创建对象。
- Spring MVC提供拦截器、异常处理器等统一处理请求机制。不需要手动编写过滤器。
- `视图解析器`：Spring MVC提供了JSP、Freemarker、Velocity等视图解析器。

## Spring MVC入门案例

创建maven工程，将工程改为war包，引入依赖：

``` xml
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/pom.xml"
```

创建`webapp/WEB-INF/web.xml`目录和文件。

在web.xml中配置前端控制器（DispatcherServlet）：

``` xml
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/webapp/WEB-INF/web.xml"
```

在Spring MVC配置文件配置包扫描视图解析器：

> 其中常见的视图解析器有以下几种：
> 
> - JSP的视图解析器：InternalResourceViewResolver
> - FreeMarker的视图解析器：FreeMarkerViewResolver
> - Velocity的视图解析器：VelocityViewResolver

``` xml
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/webapp/WEB-INF/springmvc-servlet.xml"
```

编写视图：

``` html title="hello.thymeleaf"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/webapp/WEB-INF/template/hello.thymeleaf"
```

编写Controller：

``` java
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/controller/HelloController.java"
```

启动Tomcat，通过以下地址可以访问视图：

```text
http://localhost:8080/springmvc_hello_war_exploded/hello-mvc
```

## Spring MVC执行流程

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/web_application/mvc/SpringMVC%E6%89%A7%E8%A1%8C%E8%BF%87%E7%A8%8B.svg){ loading=lazy }
  <figcaption>Spring MVC执行流程</figcaption>
</figure>
