---
layout: note
title: JDBC
nav_order: 10
parent: 数据库开发
create_time: 2024/2/4
---

# 简介

JDBC（Java Database Connectivity）是一种用于执行SQL语句的Java API，可以为多种关系数据库提供统一访问，它由一组用Java语言编写的类和接口组成。

JDBC API由两个包组成：

- `java.sql`：提供了与数据库交互的核心API
- `javax.sql`：提供了与数据源交互的API

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202402041749021.png)

# 注册驱动

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/RegisterDriverDemo.java %}
{% endhighlight %}

# 获取连接

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/GetConnectionDemo.java %}
{% endhighlight %}

# Statement

`Statement`存在SQL注入问题，不推荐使用。一般使用`PreparedStatement`。

{: .note-title}
> ORM思想
> 
> `对象关系映射`（英语：Object Relational Mapping，简称ORM，或O/RM，或O/R mapping）是一种技术，用于在面向对象编程语言和关系型数据库之间建立映射关系，让开发者可以用面向对象的方式操作数据库，简化了数据处理过程。

{: .note-title}
> PreparedStatement为什么可以解决Sql注入
> 
> PreparedStatement使用占位符`?`，在执行SQL语句之前，会对SQL语句进行预编译，这样可以防止SQL注入。

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/StatementDemo.java %}
{% endhighlight %}

# BLOB类型

BLOB类型类型分类：
- TINYBLOB：最大长度为255字节
- BLOB：最大长度为65535字节(64KB)
- MEDIUMBLOB：最大长度为16777215字节(16MB)
- LONGBLOB：最大长度为4294967295字节(4GB)

只有`PreparedStatement`可以处理BLOB类型。而`Statement`不可以。

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/BlobDemo.java %}
{% endhighlight %}

{: .warning}
> 处理大文件时需要设置mysql配置文件`my.ini`，增加`max_allowed_packet`参数设置允许的最大数据包大小。

# 批量插入数据优化

需要配置参数`rewriteBatchedStatements=true`，否则addBatch无效，仍然是一条一条插入。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202402062125803.png)

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/BatchInsertDemo.java %}
{% endhighlight %}

# 事务

事务的ACID属性：
- `原子性（Atomicity）`：事务是一个不可分割的工作单位，事务中的操作要么都发生，要么都不发生。
- `一致性（Consistency）`：事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态。
- `隔离性（Isolation）`：一个事务的执行不能被其他事务干扰。
- `持久性（Durability）`：事务一旦提交，对数据库的改变是永久的。

数据库并发问题：
- `脏读（Dirty Read）`：T1和T2两个事务，T1读取了T2`未提交`的数据。之后T2回滚，T1读取的数据是临时且无效的脏数据。
- `不可重复读（Non-Repeatable Read）`：T1和T2两个事务，T1从`表中读取一个字段`，T2`更新`了这个字段并提交，T1再次读取这个字段，发现和第一次读取的值不一样。
- `幻读（Phantom Read）`：T1和T2两个事务，T1从`表中读取了一些数据`，T2`插入`了一些数据并提交，T1再次读取这个表，发现多了一些数据。

四种隔离级别：
- `读未提交（Read Uncommitted）`：允许脏读、不可重复读、幻读。
- `读已提交（Read Committed）`：允许不可重复读、幻读。不允许脏读。
- `可重复读（Repeatable Read）`：允许幻读。不允许脏读、不可重复读。
- `串行化（Serializable）`：最高隔离级别，不允许脏读、不可重复读、幻读。

```sql
-- 查看当前事务隔离级别
# 老版本
SELECT @@tx_isolation;
# 新版本
SELECT @@transaction_isolation;

# 设置当前事务隔离级别
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

# 设置数据库全局事务隔离级别
SET GLOBAL TRANSACTION ISOLATION LEVEL READ COMMITTED;
```

代码操作隔离级别：

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/TransactionIsolationDemo.java %}
{% endhighlight %}

事务操作：

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/TransactionDemo.java %}
{% endhighlight %}

# 连接池

如果每次操作数据库都创建一个新的连接，会导致性能低下。

连接池的作用是在应用启动时创建一定数量的数据库连接，放入连接池中，当应用需要连接数据库时，直接从连接池中获取连接，使用完毕后归还连接。

常见的连接池：
- `DBCP`：Apache开源的连接池，功能简单，性能一般。
- `C3P0`：老牌连接池，稳定，但不再维护。
- `Druid`：阿里巴巴开源的连接池，功能强大，性能优越。

## c3p0连接池

c3p0连接池配置文件`c3p0-config.xml`：

{% highlight xml %}
{% include_relative jdbc-demo/src/main/resources/c3p0-config.xml %}
{% endhighlight %}

c3p0简单示例：

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/C3p0Demo.java %}
{% endhighlight %}

## dbcp连接池

dbcp配置文件：

{% highlight xml %}
{% include_relative jdbc-demo/src/main/resources/dbcp.properties %}
{% endhighlight %}

dbcp简单示例：

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/DBCPDemo.java %}
{% endhighlight %}

## druid连接池

配置文件：

{% highlight xml %}
{% include_relative jdbc-demo/src/main/resources/druid.properties %}
{% endhighlight %}

druid简单示例：

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/DruidDemo.java %}
{% endhighlight %}

# Apache DBUtils

Apache DBUtils是Apache组织提供的一个开源的JDBC工具类库，它是对JDBC的`增删改查`简单封装，学习成本低，使用简单。

{% highlight java %}
{% include_relative jdbc-demo/src/main/java/com/luguosong/DbutilsDemo.java %}
{% endhighlight %}




