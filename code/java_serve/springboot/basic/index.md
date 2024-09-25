# 基础知识

## 功能概述

- 创建独立的 Spring 应用程序
- 直接嵌入 Tomcat、Jetty 或 Undertow（无需部署 WAR 文件）
- 提供预配置的 "starter" 依赖项，以简化构建配置
- 在可能的情况下，自动配置 Spring 和第三方库
- 提供生产就绪的功能，如指标、健康检查和外部化配置
- 绝不进行代码生成，也不需要 XML 配置

## 入门案例

### Maven方式

- 创建Maven项目
- pom.xml继承`spring-boot-starter-parent`父项目，并引入相关`依赖`，配置`打包插件`：

``` xml title="pom.xml"
--8<-- "code/java_serve/springboot/basic/springboot-hello/pom.xml"
```

- 创建Spring Boot配置文件

``` yaml title="application.yml"
--8<-- "code/java_serve/springboot/basic/springboot-hello/src/main/resources/application.yml"
```

- 编写项目入口程序：

``` java title="SpringBootHelloApplication.java"
--8<-- "code/java_serve/springboot/basic/springboot-hello/src/main/java/com/luguosong/SpringBootHelloApplication.java"
```

!!! note

	Spring Boot 会扫描入口类下面以及其子包下的所有类。

- 编写Controller:

``` java title="HelloController.java"
--8<-- "code/java_serve/springboot/basic/springboot-hello/src/main/java/com/luguosong/controller/HelloController.java"
```

### Spring Initializr方式

- 创建Spring Initializr项目

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141347754.png){ loading=lazy }
  <figcaption>创建Spring Initializr项目</figcaption>
</figure>

- 选中需要的启动器(spring-boot-starter-xxx)

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141351990.png){ loading=lazy }
  <figcaption>选中需要的启动器</figcaption>
</figure>

- 创建工具会引入相关依赖，并自动生成`配置文件`和`启动类`。

## 依赖管理机制

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141436307.png){ loading=lazy }
  <figcaption>依赖管理机制</figcaption>
</figure>

`Spring场景启动器`会将该场景需要的依赖全部导入

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141423974.png){ loading=lazy }
  <figcaption>spring-boot-starter-web导入web开发的全部依赖</figcaption>
</figure>

Spring Boot 父项目`spring-boot-starter-parent`继承自`spring-boot-dependencies`项目（版本仲裁中心），该项目通过
`<dependencyManagement>`
管理依赖版本。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141425489.png){ loading=lazy }
  <figcaption>spring-boot-dependencies负责版本管理</figcaption>
</figure>

Maven版本具有就近原则特性，如果我们不想使用Spring Boot提供的依赖版本。可以在当前项目自定义`<properties>`
标签自定义版本，标签名需要与spring-boot-dependencies中的一致。

## 自动配置机制

### 基本执行流程

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141503347.png){ loading=lazy }
  <figcaption>Spring Boot 自动配置机制</figcaption>
</figure>


