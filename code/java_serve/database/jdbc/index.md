# JDBC

## JDBC概述

Java数据库连接，（Java Database Connectivity，简称`JDBC`）是Java语言中用来规范客户端程序如何来访问数据库的`应用程序接口`，提供了诸如查询和更新数据库中数据的方法。JDBC也是Sun Microsystems的商标。JDBC是面向`关系型数据库`的。

## 入门案例

JDBC编程可以分为以下三个步骤：

1. 连接到数据源
2. 向数据库发送查询和更新语句
3. 检索和处理从数据库收到的查询结果

---

- 导入依赖

```xml
<!--java连接MySQL-->
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.3.0</version>
</dependency>
```

- 代码如下：

``` java
--8<-- "code/java_serve/database/jdbc/jdbc-demo/src/main/java/com/luguosong/JDBCHello.java"
```

!!! warning

    JDBC4.0之后 自动扫描jar包下这个文件，理论上是不用我们主动的注册驱动，方便了我们的编程。

    <figure markdown="span">
      ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202407022117913.png){ loading=lazy }
      <figcaption></figcaption>
    </figure>

## Sql注入

### Sql注入问题

### prepareStatement解决Sql注入
