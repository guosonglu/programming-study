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

`Spring Web MVC` 是基于 Servlet API 构建的原始 Web 框架，从 Spring 框架诞生之初就已包含其中。其正式名称`Spring Web MVC`
源自其源码模块名称:`spring-webmvc`，但更常被称为`Spring MVC`。

与 Spring Web MVC 并行，Spring Framework 5.0 引入了一个名为`Spring WebFlux`的响应式堆栈Web框架，其名称也基于其源模块
`spring-webflux`。

`Spring MVC`是实现`MVC架构模式`的Web框架。底层使用`Servlet`实现。

!!! note "Spring MVC能干什么"

    - 入口控制：通过`DispatcherServlet`作为入口控制器负责接收请求和分发请求。
    - 自动将表单请求参数封装为JavaBean对象
    - 统一使用IOC容器管理对象
    - 统一请求处理：提供拦截器、统一异常处理等机制
    - 视图解析：轻松切换JSP、Freemarker、Velocity等视图模板
    - 对Controller进行单元测试时

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

在`web.xml`中配置前端控制器（DispatcherServlet）：

!!! note

    相比于Servlet开发，Spring MVC会配置一个全局统一的`DispatcherServlet`来管理所有请求。

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

!!! note

    `逻辑视图名称`会根spring mvc配置文件中的`prefix`和`suffix`属性进行拼接。找到具体的视图位置(物理视图名称)。

启动Tomcat，通过以下地址可以访问视图：

```text
http://localhost:8080/springmvc_hello_war_exploded/hello-mvc
```

## Spring MVC执行流程

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/web_application/mvc/SpringMVC%E6%89%A7%E8%A1%8C%E8%BF%87%E7%A8%8B.svg){ loading=lazy }
  <figcaption>Spring MVC执行流程</figcaption>
</figure>

## 自定义Spring MVC配置文件名称

默认情况下，Spring MVC会根据web.xml中`<servlet-name>标签`的值去寻找Spring MVC配置文件。

比如`<servlet-name>`的值为`springmvc`，那么就会去寻找`/WEB-INF/springmvc-servlet.xml`配置文件。

当然，也可以手动指定Spring MVC配置文件：

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee https://jakarta.ee/xml/ns/jakartaee/web-app_6_0.xsd"
         version="6.0">
    <servlet>
        <servlet-name>springmvc</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <!--指定配置文件位置-->
        <init-param>
            <param-name>contextConfigLocation</param-name>
            <param-value>classpath:springmvc-servlet.xml</param-value>
        </init-param>
    </servlet>
    <servlet-mapping>
        <servlet-name>springmvc</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
</web-app>
```

## @RequestMapping注解

### @RequestMapping注解的使用

您可以使用`@RequestMapping`注解将请求映射到控制器方法。

`@RequestMapping`可以作用于`类`或者`方法`。

### value属性

`value属性`与`path属性`功能相同,都是用于映射请求路径。

```java

@Controller
public class HelloController {
    //请求映射
    @RequestMapping("/hello1-1")
    public String hello() {
        //返回逻辑视图名称
        return "hello";
    }

    //多个映射可以指向同一个方法
    @RequestMapping({"/hello2-1", "/hello2-2"})
    public String hello() {
        //返回逻辑视图名称
        return "hello";
    }
}
```

### value属性Ant风格

value属性也支持`Ant风格`的通配符：

- `?`:匹配任意单个字符
- `*`:匹配任意多个字符
- `**`:匹配任意多个字符（包括目录,即`/`）

!!! warning

    如果使用`**`，左右两边只能是`/`。

```java

@Controller
public class HelloController {
    //?表示任意单个字符，比如 hello1 或 helloa 都会访问到该方法
    @RequestMapping("/hello?")
    public String hello() {
        //返回逻辑视图名称
        return "hello";
    }
}
```

### value属性占位符

使用`占位符`，可以实现`Restful风格`的参数传递

方法中通过`@PathVariable`获取参数

```java

@Controller
public class HelloController {
    @RequestMapping("/login/{username}/{password}")
    public String login(@PathVariable String username,
                        @PathVariable String password) {
        //用户登录
        //...
        return "ok";
    }
}
```

### method属性

`method属性`用于限制请求方法，`method`属性的值可以是`GET`、`POST`、`PUT`、`DELETE`等。

```java

@Controller
public class HelloController {
    //只会接收Get类型的请求
    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String hello() {
        //返回逻辑视图名称
        return "hello";
    }
}
```

### 衍生Mapping

除了`@RequestMapping`注解，还可以使用`@GetMapping`、`@PostMapping`、`@PutMapping`、`@DeleteMapping`、`@PatchMapping`
等注解。表示具体method方法的请求。

### params属性

`params属性`对请求参数进行限制

```java

@Controller
public class HelloController {
    //表示请求参数中必须存在username和password，且username必须为张三
    @PostMapping(value = "/hello", params = {"username=张三", "password"})
    public String hello() {
        //返回逻辑视图名称
        return "ok";
    }
}
```

### headers属性

`headers属性`对请求头进行限制

```java

@Controller
public class HelloController {
    //表示请求头中必须存在token
    @PostMapping(value = "/hello", headers = {"token"})
    public String hello() {
        //返回逻辑视图名称
        return "ok";
    }
}
```

## 获取请求参数

### 形参获取表单请求参数

``` java title="FormController.java"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/controller/parameters/FormController.java"
```

!!! warning "如果是Spring6+,想要省略@RequestParam注解，需要在pom.xml中配置`-parameters`标记"

    ```xml
    
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.13.0</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                    <compilerArgs>
                        <arg>-parameters</arg>
                    </compilerArgs>
                </configuration>
            </plugin>
        </plugins>
    </build>
    ```

### JavaBean获取表单请求参数

``` java title="FormPojoController.java"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/controller/parameters/FormPojoController.java"
```

``` java title="User.java"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/pojo/User.java"
```

### Get请求中文乱码问题

Tomcat8以及之前版本，解决Get请求中文乱码，在Tomcat服务器`CATALINA_HOME/conf/server.xml`中配置:

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202408211608413.png){ loading=lazy }
  <figcaption>解决Get请求乱码问题</figcaption>
</figure>

Tomcat8之后版本，请求行默认采用UTF-8编码，无需解决中文乱码问题。

### Post请求中文乱码问题

Tomcat9以及之前的版本，需要解决Post请求中文乱码问题。

在`Servlet编程`中，可以使用`request.setCharacterEncoding("UTF-8");`解决乱码问题。

但在Spring MVC中，无法在Controller中使用以上方法解决中文乱码。

解决方案一：编写`Servlet过滤器`，过滤器会在DispatcherServlet之前执行。因此在过滤器中设置
`request.setCharacterEncoding("UTF-8");`
可以解决乱码问题。

解决方案二：Spring MVC为我们提供了类似的过滤器类CharacterEncodingFilter，无需我们重新手写过滤器类。只需要在`web.xml`
中配置该过滤器并设置`encoding属性`即可。

Tomcat10请求体默认采用UTF-8编码，无需解决中文乱码问题。

## 获取请求头信息

### 根据请求头名称获取请求头信息

``` java title="HeaderInfoController.java"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/controller/header_info/HeaderInfoController.java"
```

### 获取Cookie信息

``` java title="CookieController.java"
--8<-- "docs/java_serve/web_application/mvc/springmvc-hello/src/main/java/com/luguosong/controller/header_info/CookieController.java"
```

## 域对象操作


