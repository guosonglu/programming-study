# Mybatis

## JDBC的不足

- SQL语句是写在程序中的，当数据库表结构发生变化，需要修改源码。不符合开闭原则。
- prepareStatement需要重复进行参数设置，代码繁琐冗余。
- 结果集的处理繁琐，需要手动处理。

## 入门案例

创建项目，引入maven依赖：

``` xml
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/pom.xml"
```

创建核心配置文件：

``` xml
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/resources/mybatis-config.xml"
```

编写实体类：

``` java
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/java/com/luguosong/pojo/Car.java"
```

编写Mapper接口：

``` java
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/java/com/luguosong/mapper/CarMapper.java"
```

编写Mapper映射文件：

``` xml
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/resources/com/luguosong/mapper/CarMapper.xml"
```

配置log4j日志配置文件：

``` properties
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/resources/log4j.properties"
```

创建测试类：

``` java
--8<-- "docs/java_serve/database/mybatis/mybatis-hello/src/main/java/com/luguosong/MyBatisTest.java"
```

## Mybatis核心配置文件

### 事务管理方式

- `type="JDBC"` JDBC事务管理，mybatis框架自己管理事务,底层使用JDBC
- `type="MANAGED"` 由容器管理事务，例如Spring容器

```xml

<configuration>
    <environments default="development">
        <environment id="development">
            <!--事务管理方式-->
            <transactionManager type="JDBC"/>
            <dataSource type="POOLED">
                <!--...-->
            </dataSource>
        </environment>
    </environments>
</configuration>
```

### 数据源类型

- `type="POOLED"` 使用mybatis自带的连接池
- `type="UNPOOLED"` 不使用连接池
- `type="JNDI"`  集成第三方连接池，例如c3p0、druid等

```xml

<configuration>
    <environments default="development">
        <environment id="development">
            <!--数据源类型-->
            <dataSource type="POOLED">
                <!--...-->
            </dataSource>
        </environment>
    </environments>
</configuration>
```

### 引入外部properties配置文件

```properties title="jdbc.properties"
driver=com.mysql.cj.jdbc.Driver
url=jdbc-url=jdbc-url
username=root
password=123456
```

```xml

<configuration>
    <!--引入外部配置文件-->
    <properties resource="jdbc.properties"/>

    <environments default="development">
        <environment id="development">
            <dataSource type="POOLED">
                <!--获取properties配置-->
                <property name="driver" value="${driver}"/>
                <property name="url" value="${url}"/>
                <property name="username" value="${username}"/>
                <property name="password" value="${password}"/>
            </dataSource>
        </environment>
    </environments>
</configuration>
```

### 设置类型别名

核心配置文件中配置`类型别名`：

```xml

<configuration>
    <typeAliases>
        <typeAlias type="com.luguosong.pojo.Car" alias="Car"/>
    </typeAliases>
</configuration>
```

在Mapper映射配置文件中可以直接使用别名：

```xml

<mapper namespace="com.luguosong.mapper.CarMapper">
    <!--resultType可以直接使用别名表示-->
    <select id="selectCarById" resultType="Car">
        select * from t_car where id = #{id}
    </select>
</mapper>
```

也可以配置`package`，指定包下的类都以`类名`作为别名：

```xml

<configuration>
    <typeAliases>
        <package name="com.luguosong.pojo"/>
    </typeAliases>
</configuration>
```

### 配置映射文件

方式一：指定每一个xml映射配置文件

```xml

<configuration>
    <mappers>
        <mapper resource="com/luguosong/mapper/Mapper1.xml"/>
        <mapper resource="com/luguosong/mapper/Mapper2.xml"/>
        <mapper resource="com/luguosong/mapper/Mapper3.xml"/>
    </mappers>
</configuration>
```

方式二：指定映射文件目录

!!! warning

    使用`目录方式`配置Mapper映射，映射文件的`包名`和`文件名`需要与Mapper接口保持一致。

```xml

<configuration>
    <mappers>
        <package name="com/luguosong/mapper"/>
    </mappers>
</configuration>
```

## 参数获取

### 字符串拼接

`${xxx}`表示采用字符串拼接的方式生成sql语句

```xml

<mapper namespace="xxx">
    <select id="xxx" resultType="xxx">
        select * from t_car where id = ${id}
    </select>

    <!--如果参数是字符串，需要手动加上引号-->
    <select id="xxx" resultType="xxx">
        select * from t_car where name = '${name}'
    </select>
</mapper>
```

!!! warning

    这种方式会引起sql注入

### 占位符赋值👍🏻

`#{xxx}`表示采用占位符赋值的方式生成sql语句

```xml

<mapper namespace="xxx">
    <!--Car selectCarById(Integer id);-->
    <select id="xxx" resultType="xxx">
        select * from t_car where id = #{id}
    </select>
</mapper>
```

### 单个参数

```xml title="单个参数的情况"

<mapper namespace="xxx">
    <!--Car selectCarById(Integer id);-->
    <select id="xxx" resultType="xxx">
        select * from t_car where id = #{id}
    </select>

    <!--当只有一个参数时，#{}中键名可以随便写-->
    <select id="xxx" resultType="xxx">
        select * from t_car where id = #{aaa}
    </select>
</mapper>
```

### 多个参数传递

多个参数时，Mybatis会采用`默认键名`将参数封装到Mapper集合中。

```xml title="多个参数的情况"

<mapper namespace="xxx">
    <!--多个参数的情况-->
    <!--User selectUser(String username, String password);-->
    <select id="xxx" resultType="xxx">
        select * from t_user where username = #{arg0} and password = #{arg1}
    </select>
    <!--或-->
    <select id="xxx" resultType="xxx">
        select * from t_user where username = #{param0} and password = #{param1}
    </select>
</mapper>
```

### 多个参数传递-@Param

`@Param`会将参数以指定`键名`封装进Mapper集合中。

```xml

<mapper namespace="xxx">
    <!--User selectUser(@Param("username") String username, @Param("password") String password);-->
    <select id="xxx" resultType="xxx">
        select * from t_user where username = #{username} and password = #{password}
    </select>
</mapper>
```

### 对象和Mapper集合

```xml title="适用于对象和mapper集合"

<mapper namespace="xxx">
    <!--当参数为对象，参与对象中的字段名获取参数-->
    <!--User selectUser(User user);-->
    <select id="xxx" resultType="xxx">
        select * from t_user where username = #{username} and password = #{password}
    </select>
</mapper>
```

### 模糊查询

模糊查询不能直接使用`#{xxx}`，需要使用`${xxx}`，或者使用`CONCAT`关键字进行字符串拼接。

```xml

<mapper namespace="com.example.UserMapper">
    <!--方式一-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM users WHERE name LIKE '%${name}%'
    </select>

    <!--方式二-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM users WHERE name LIKE CONCAT('%', #{name}, '%')
    </select>

    <!--错误方式i-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM users WHERE name LIKE '%${name}%'
    </select>
</mapper>
```

## 结果集处理

### 查询具体值

查询具体值可以使用`包装类`接收

```xml

<mapper namespace="xxx">
    <!--Integer getCount();-->
    <select id="getCount" resultType="Integer">
        select count(*) from t_user
    </select>
</mapper>
```

### 查询单条数据

Mapper接口采用`实体类`接收

```xml

<mapper namespace="xxx">
    <!--User selectUserById();-->
    <select id="selectUserById" resultType="User">
        select * from t_user where id = #{id}
    </select>
</mapper>
```

也可以使用`Map集合`接收查询结果

```xml

<mapper namespace="xxx">
    <!--Map<String, Object> selectUserById();-->
    <select id="selectUserById" resultType="Map">
        select * from t_user where id = #{id}
    </select>
</mapper>
```

### 查询多条数据

Mapper接口采用`List集合`接收

```xml

<mapper namespace="xxx">
    <!--List<User> selectAllUser();-->
    <select id="selectAllUser" resultType="User">
        select * from t_user
    </select>
</mapper>
```


