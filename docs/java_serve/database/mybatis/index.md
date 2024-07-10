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
        SELECT * FROM user WHERE name LIKE '%${name}%'
    </select>

    <!--方式二-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM user WHERE name LIKE CONCAT('%', #{name}, '%')
    </select>

    <!--方式三👍🏻-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM user WHERE name LIKE "%"#{name}"%"
    </select>

    <!--错误方式❌-->
    <!--List<User> selectUserByName(String name);  -->
    <select id="selectUserByName" resultType="User">
        SELECT * FROM user WHERE name LIKE '%#{name}%'
    </select>
</mapper>
```

### 批量操作

需要批量操作时，只能使用`${xxx}`进行字符串拼接，不能使用`#{xxx}`

```xml

<mapper namespace="com.example.UserMapper">
    <!--int deleteUsers(@Param("ids") String ids)-->
    <delete>
        delete from user where id in (${ids})
    </delete>
</mapper>
```

## 设置自动递增主键

设置`useGeneratedKeys="true"`表示 MyBatis 会在插入记录后自动获取数据库生成的主键值，并将这个值填充到`对象的id属性`
中。这样你就不需要手动查询数据库来获取新插入记录的主键。

```xml

<mapper namespace="com.example.UserMapper">
    <!--void insertUser(User user);-->
    <insert id="insertUser" useGeneratedKeys="true" keyProperty="id">
        insert into user values(null,#{name}, #{age})
    </insert>
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
    <!--User selectUserById(Integer id);-->
    <select id="selectUserById" resultType="User">
        select * from t_user where id = #{id}
    </select>
</mapper>
```

也可以使用`Map集合`接收查询结果

```xml

<mapper namespace="xxx">
    <!--Map<String, Object> selectUserById(Integer id);-->
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

### 表和实体类字段名不一致

解决方式一：查询结果使用`别名`,将表中的字段名改为与实体类字段名一致。

```xml

<mapper namespace="xxx">
    <!--将phone_number改为与实体类一致的phoneNumber-->
    <!--User selectUserById(Integer id);-->
    <select id="selectAllUser" resultType="User">
        select id,name, phone_number phoneNumber from user where id = #{id}
    </select>
</mapper>
```

解决方案二：在核心配置文件中进行配置，让数据库字段名自动转换为实体类字段名。

> 比如：可以自动将phone_number转为phoneNumber

```xml

<configuration>
    <settings>
        <!--表示根据驼峰命名法自动匹配结果集-->
        <setting name="mapUnderscoreToCamelCase" value="true"/>
    </settings>
</configuration>
```

解决方案三：使用ResultMap

```xml

<mapper namespace="xxx">

    <resultMap id="UserMap" type="User">
        <id property="id" column="id"/>
        <result property="name" column="name"/>
        <result property="phoneNumber" column="phone_number"/>
    </resultMap>

    <!--User selectUserById(Integer id);-->
    <select id="selectAllUser" resultMap="UserMap">
        select id,name, phone_number from user where id = #{id}
    </select>
</mapper>
```

### resultMap处理多对一

> 需求：用户和部门之间的`多对一`关系，查询员工以及员工所在部门。

```java title="用户实体类"
public class User {
    private int id;
    private String name;
    private int age;
    private int departmentId;
    // 嵌入部门对象
    private Department department;
    // getters and setters
}
```

```java title="部门实体类"
public class Department {
    private int id;
    private String name;
    // getters and setters
}
```

#### 嵌套属性映射

```xml

<mapper namespace="com.example.UserMapper">
    <resultMap id="userResultMap" type="User">
        <id property="id" column="u.id"/>
        <result property="name" column="u.name"/>
        <result property="age" column="u.age"/>
        <result property="department.id" column="d.id"/>
        <result property="department.name" column="d.name"/>
    </resultMap>

    <!--User selectUserById(Integer id);-->
    <select id="selectUserById" resultMap="userResultMap">
        SELECT u.id, u.name, u.age,
        d.id , d.name
        FROM user u
        LEFT JOIN department d ON u.departmentId = d.id
        WHERE u.id = #{id}
    </select>
</mapper>
```

#### association标签

```xml

<mapper namespace="com.example.UserMapper">
    <resultMap id="userResultMap" type="User">
        <id property="id" column="u.id"/>
        <result property="name" column="u.name"/>
        <result property="age" column="u.age"/>
        <association property="department" javaType="Department">
            <id property="id" column="d.id"/>
            <id property="name" column="d.name"/>
        </association>
    </resultMap>

    <!--User selectUserById(Integer id);-->
    <select id="selectUserById" resultMap="userResultMap">
        SELECT u.id, u.name, u.age,
        d.id , d.name
        FROM user u
        LEFT JOIN department d ON u.departmentId = d.id
        WHERE u.id = #{id}
    </select>
</mapper>
```

#### 分步查询

!!! note "分步查询的好处"

    - 每个查询是分开的，可以单独使用，也可以合并使用

```xml title="根据id查询部门"

<mapper namespace="com.example.DepartmentMapper">
    <!--Department selectDepartmentById(Integer id);-->
    <select id="selectDepartmentById" resultType="Department">
        SELECT * FROM department WHERE id = #{id}
    </select>
</mapper>
```

```xml

<mapper namespace="com.example.UserMapper">
    <resultMap id="userResultMap" type="User">
        <id property="id" column="u.id"/>
        <result property="name" column="u.name"/>
        <result property="age" column="u.age"/>
        <!--select表示分步查询的方法-->
        <!--column表示分步查询的字段（条件）-->
        <!--fetchType:当核心配置文件开启延迟加载时，
        fetchType用于控制单个查询是否开启延迟加载，
        默认为lazy，eager表示立即加载-->
        <association property="department"
                     select="com.example.DepartmentMapper.selectDepartmentById"
                     column="departmentId"
                     fetchType="eager"/>
    </resultMap>
    <!--User selectUserById(Integer id);-->
    <select id="selectUserById" resultMap="userResultMap">
        SELECT * FROM user WHERE id = #{id}
    </select>
</mapper>
```



### resultMap处理一对多

> 需求：部门和用户之间的`一对多`关系，查询部门以及部门下的所有员工。

```java title="用户实体类"
public class User {
    private int id;
    private String name;
    private int age;
    private int departmentId;
    // getters and setters
}
```

```java title="部门实体类"
public class Department {
    private int id;
    private String name;
    //一个部门下有多个员工
    private List<User> users;
    // getters and setters
}
```

#### collection标签

#### 分步查询

### 延迟加载

使用分步查询时，可以开启延迟加载，第二步查询会延迟执行：

```xml

<configuration>
    <settings>
        <!--表示开启延迟加载，多表查询分步操作第二步会延迟执行-->
        <setting name="lazyLoadingEnabled" value="true"/>
        <setting name="aggressiveLazyLoading" value="false"/>
    </settings>
</configuration>
```
