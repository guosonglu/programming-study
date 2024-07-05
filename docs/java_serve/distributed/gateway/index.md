# 网关

## 网关的作用

- 反向代理
- 鉴权
- 流量控制
- 熔断
- 日志监控

## Spring Cloud Gateway入门案例

创建路由模块:

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407021009775.png){ loading=lazy }
  <figcaption>创建Spring Boot</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202407021018857.png){ loading=lazy }
  <figcaption>选择gateway依赖</figcaption>
</figure>

项目创建成功，pom.xml文件如下：

``` xml
--8<-- "docs/java_serve/distributed/gateway/spring_cloud_gateway_hello/gateway-hello/pom.xml"
```

在spring boot配置文件中配置网关路由：

``` yaml
--8<-- "docs/java_serve/distributed/gateway/spring_cloud_gateway_hello/gateway-hello/src/main/resources/application.yml"
```

创建端口号为8101的测试目标模块。

通过 `http://localhost:8101/hello` 可以直接访问目标服务（实际开发中前端不会直接访问目标服务）

现在有了网关，可以通过网关访问目标服务：`http://localhost:8100/hello`

## 路由



## 断言



## 过滤器
