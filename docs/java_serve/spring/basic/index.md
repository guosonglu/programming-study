# Spring教程

## 不使用Spring存在的问题

- 使用`new`创建对象时，用到了`具体的`
  实现类。当业务需求反复变化，实现类变更为其它类。需要反复修改创建对象处的代码。不满足`开闭原则`。
- 使用`new`创建对象。依赖了具体实现类，不符合`依赖倒置原则`。

## Spring概述

`Spring框架`是 Java 平台的一个开源的全栈（full-stack）应用程序框架和控制反转容器实现，一般被直接称为
Spring。该框架的一些核心功能理论上可用于任何 Java 应用，但 Spring 还为基于Java企业版平台构建的 Web 应用提供了大量的拓展支持。Spring
没有直接实现任何的编程模型，但它已经在 Java 社区中广为流行，基本上完全代替了`企业级JavaBeans（EJB）模型`。

Spring框架以 Apache License 2.0 开源许可协议的形式发布，该框架最初由 `Rod Johnson` 以及 Juergen Hoeller 等人开发。

## Spring模块

- `Spring Core`：Spring Core是Spring框架的核心模块，提供了`IoC（Inversion of Control、控制反转）容器`
  的实现和支持。它负责创建、配置和管理应用程序中的对象，并通过依赖注入的方式解耦组件之间的依赖关系。
- `Spring AOP`：Spring AOP模块实现了面向切面编程（AOP）的支持。它允许开发者通过定义切点和切面，将横切关注点（如日志记录、性能监控等）与业务逻辑分离，从而提高代码的模块化和可维护性。
- `Spring Web MVC`：Spring Web
  MVC是Spring框架的Web应用程序开发模块。它提供了一种基于MVC（Model-View-Controller）的架构，用于构建灵活、可扩展的Web应用程序。开发者可以使用注解或配置文件定义控制器、视图和模型，并实现Web请求的处理和响应。
- `Spring WebFlux`：Spring5新增模块，Spring
  WebFlux是Spring框架的响应式Web开发模块。它基于反应式编程模型，提供了一种异步、非阻塞的方式处理Web请求。开发者可以使用注解或函数式编程风格定义处理器函数，并利用响应式流处理请求和响应。
- `Spring Web`：Spring Web模块是Spring框架的Web应用程序支持模块，提供了与Servlet
  API和其他Web相关技术的集成。它包括与Web安全、文件上传、WebSockets等相关的功能和工具，帮助开发者构建全功能的Web应用程序。
- `Spring DAO`：Spring
  DAO模块提供了对数据访问对象（DAO）的支持。它简化了与数据库的交互，提供了一组抽象和实现，用于执行CRUD操作、批处理、存储过程调用等。开发者可以集成各种数据访问技术（如JDBC、Hibernate、JPA等）来实现灵活和可扩展的数据访问层。
- `Spring ORM`：Spring ORM模块用于集成和支持各种对象关系映射（ORM）框架，如Hibernate、JPA等。它提供了事务管理、异常转换和对象关系映射等功能，简化了与关系型数据库的交互。
- `Spring Context`：Spring Context是Spring框架的核心模块之一，实现了IoC容器的功能。它负责管理和组织应用程序中的各个组件，包括Bean管理、依赖注入、生命周期管理、事件机制等。Spring
  Context提供了一个上下文环境，使得开发者能够更方便地构建和管理应用程序。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405301022240.png){ loading=lazy }
  <figcaption>Spring八大模块</figcaption>
</figure>

## 版本说明

| Spring版本 | Jakarta EE版本                  | JDK版本     |
|----------|-------------------------------|-----------|
| 5.3.x    | Java EE 7-8 (javax namespace) | 8-21      |
| 6.0.x    | 9-10                          | 17-21     |
| 6.1.x    | 9-10                          | 17-23     |
| 6.2.x    | 9-11                          | 17-25(预计) |

## ICO入门案例

- 引入依赖：

``` xml
--8<-- "docs/java_serve/spring/basic/spring-hello/pom.xml"
```

> `spring-context`依赖内部会引用其它核心模块：

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405301128137.png){ loading=lazy }
  <figcaption>spring-context依赖内部引入其它核心模块</figcaption>
</figure>

- 创建User对象：

``` java title="User.java"
--8<-- "docs/java_serve/spring/basic/spring-hello/src/main/java/com/luguosong/ioc/hello/User.java"
```

- 编写Spring配置文件：

``` xml title="spring_config_hello.xml"
--8<-- "docs/java_serve/spring/basic/spring-hello/src/main/resources/spring_config_hello.xml"
```

- 编写测试类：

``` java title="SpringHello.java"
--8<-- "docs/java_serve/spring/basic/spring-hello/src/main/java/com/luguosong/ioc/hello/SpringHello.java"
```

## IOC原理分析

`初始化阶段`：Spring读取配置文件中的bean标签，根据其中的`class属性`(类的全限定类名)，默认通过`反射`
调用类的无参构造创建对象，并将对象实例跟`id属性`绑定封装成Map集合。

`使用阶段`：Spring根据`id名称`可以获取到对应的`对象实例`。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/spring/basic/Spring%20IOC%E5%8E%9F%E7%90%86.svg){ loading=lazy }
  <figcaption>IOC原理图</figcaption>
</figure>

