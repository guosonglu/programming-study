# Mybatis Plus

## 入门案例

创建项目，导入相关依赖：

``` xml
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/pom.xml"
```

application.yml文件配置数据库连接：

``` yaml
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/src/main/resources/application.yml"
```

在 Spring Boot 启动类中添加 @MapperScan 注解，扫描 Mapper 文件夹:

``` java
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/src/main/java/com/luguosong/mybatisplushello/MybatisPlusHelloApplication.java"
```

编写实体类：

``` java
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/src/main/java/com/luguosong/mybatisplushello/entity/Employees.java"
```

编写 Mapper 接口类:

``` java
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/src/main/java/com/luguosong/mybatisplushello/mapper/EmployeesMapper.java"
```

编写测试类：

``` java
--8<-- "docs/java_serve/database/mybatis_plus/mybatis-plus-hello/src/test/java/com/luguosong/mybatisplushello/MybatisPlusHelloApplicationTests.java"
```

## 代码生成器


