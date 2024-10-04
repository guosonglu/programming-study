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

### 场景启动器

`Spring场景启动器`会将该场景需要的依赖全部导入

!!! note "场景启动器命名规则"

	- 官方场景：spring-boot-starter-xxx
	- 第三方场景：xxx-spring-boot-starter

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141423974.png){ loading=lazy }
  <figcaption>spring-boot-starter-web导入web开发的全部依赖</figcaption>
</figure>

### 版本管理

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141436307.png){ loading=lazy }
  <figcaption>依赖管理机制</figcaption>
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

### spring-boot-autoconfigure依赖

所有`spring-boot-starter-xxx`启动器都会依赖`spring-boot-starter`依赖。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409301603718.png){ loading=lazy }
  <figcaption>以spring-boot-starter-web为例，所有场景启动器内部都会依赖spring-boot-starter</figcaption>
</figure>

`spring-boot-starter`依赖内部会依赖`spring-boot-autoconfigure`依赖。`spring-boot-autoconfigure`负责自动配置。

### 配置属性类

在Spring Boot配置文件`application.yml`中，所有`配置项`都和某个`类的属性`值是一一绑定的。

比如，配置文件中的`server.port`属性值就对应`org.springframework.boot.autoconfigure.web.ServerProperties`类中的`port`属性的值。

属性类可以通过`@ConfigurationProperties`注解指定配置的前缀。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410012237998.png){ loading=lazy }
  <figcaption>通过@ConfigurationProperties注解指定配置的前缀</figcaption>
</figure>

也可以使用`@EnableConfigurationProperties`注解指定配置类：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410021819305.png){ loading=lazy }
  <figcaption>指定配置类</figcaption>
</figure>

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409301544981.png){ loading=lazy }
  <figcaption>可以在官方文档中查看全部配置对应的配置类</figcaption>
</figure>

### 按需自动配置

`spring-boot-autoconfigure`会使用`@ConditionalOnxxx`条件注解在条件满足时自动配置。

- `@ConditionalOnClass`:如果类路径中存在该类，则触发指定行为。
- `@ConditionalOnMissingClass`:如果类路径中不存在该类，则触发指定行为。
- `@ConditionalOnBean`:如果容器中存在该类，则触发指定行为。
- `@ConditionalOnMissingBean`:如果容器中不存在该类，则触发指定行为。

### 完整流程

<figure markdown="span">
  ![](https://edrawcloudpubliccn.oss-cn-shenzhen.aliyuncs.com/viewer/self/1059758/share/2024-10-4/1728016059/main.svg){ loading=lazy }
  <figcaption>执行流程</figcaption>
</figure>

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409141503347.png){ loading=lazy }
  <figcaption>Spring Boot 自动配置机制</figcaption>
</figure>

## 包扫描配置

### 默认配置

默认情况下，Spring Boot会扫描入口类下面以及其子包下的所有类。

```java

@SpringBootApplication
public class SpringBootHelloApplication {
	/*
	 * Spring Boot启动代码
	 * */
	public static void main(String[] args) {
		SpringApplication.run(SpringBootHelloApplication.class, args);
	}
}
```

### scanBasePackages参数

可以使用`@SpringBootApplication`注解的`scanBasePackages`参数来配置包的扫描范围。

```java

@SpringBootApplication(scanBasePackages = "com.luguosong")
public class SpringBootHelloApplication {
	/*
	 * Spring Boot启动代码
	 * */
	public static void main(String[] args) {
		SpringApplication.run(SpringBootHelloApplication.class, args);
	}
}
```

### @ComponentScan注解

可以使用`@ComponentScan`注解来配置包的扫描范围

```java

@SpringBootApplication
@ComponentScan("com.luguosong")
public class SpringBootHelloApplication {
	/*
	 * Spring Boot启动代码
	 * */
	public static void main(String[] args) {
		SpringApplication.run(SpringBootHelloApplication.class, args);
	}
}
```

