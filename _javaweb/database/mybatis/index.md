---
layout: note
title: MyBatis
nav_order: 20
parent: 数据库开发 
create_time: 2024/2/20
---

# JDBC的不足

- SQL语句是写在程序中的，当数据库表结构发生变化，需要修改源码。
- prepareStatement需要重复进行参数设置，代码繁琐冗余。
- 结果集的处理繁琐，需要手动处理。

# 入门案例

- 导入依赖

{% highlight xml %}
{% include_relative mybatis-demo/pom.xml %}
{% endhighlight %}

- 编写日志配置文件`logback.xml`

{% highlight xml %}
{% include_relative mybatis-demo/src/main/resources/logback.xml %}
{% endhighlight %}

- 编写`mybatis-config.xml`（并非必须是这个名字）核心配置文件，构建SqlSessionFactory。该配置文件中主要配置连接数据库的信息、事务管理器等。

{% highlight xml %}
{% include_relative mybatis-demo/src/main/resources/mybatis-config.xml %}
{% endhighlight %}

- 编写mapper.xml配置文件，定义SQL语句。

{% highlight xml %}
{% include_relative mybatis-demo/src/main/resources/mapper/HelloMapper.xml %}
{% endhighlight %}

- 编写代码

{% highlight java %}
{% include_relative mybatis-demo/src/main/java/com/luguosong/MyBatisHello.java %}
{% endhighlight %}

# SqlSession工具类

{% highlight java %}
{% include_relative mybatis-demo/src/main/java/com/luguosong/util/SqlSessionUtil.java %}
{% endhighlight %}

# 增删改查

{% highlight xml %}
{% include_relative mybatis-demo/src/main/resources/mapper/CRUDMapper.xml %}
{% endhighlight %}

{% highlight java %}
{% include_relative mybatis-demo/src/main/java/com/luguosong/MybatisCRUD.java %}
{% endhighlight %}

# 手写Mybatis

数据源
事务管理器 <- 事务管理器实现
MappedStatement封装sql语句


# Web应用中使用Mybatis

- 引入依赖

{% highlight xml %}
{% include_relative mybatis-web/pom.xml %}
{% endhighlight %}



