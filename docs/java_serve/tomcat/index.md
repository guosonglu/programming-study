---
icon: simple/apachetomcat
---

# Tomcat服务器

## Java服务器软件种类

- `Web 服务器`：只实现了`Servlet`和`JSP`规范
    - [Apache Tomcat](https://tomcat.apache.org/)
    - [jetty](https://eclipse.dev/jetty/):Jetty提供了一个Web服务器和Servlet容器，此外还提供了对HTTP/2、WebSocket、OSGi、JMX、JNDI、JAAS等许多集成的支持。这些组件是开源的，可供商业用途和分发免费使用。
- `应用服务器`:实现了JavaEE所有规范
    - JBOSS:内嵌Apache Tomcat
    - WebLogic
    - WebSphere

## 下载安装Tomcat

!!! 安装前提条件

    需要先安装java环境，并配有`JAVA_HOME`环境变量。

- 下载压缩包，并解压。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405102214744.png){ loading=lazy }
  <figcaption>下载Tomcat压缩包</figcaption>
</figure>

