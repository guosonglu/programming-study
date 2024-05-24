# JSP

## 设置网站欢迎页

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405191755672.png){ loading=lazy }
  <figcaption>Tomcat全局配置欢迎页</figcaption>
</figure>

项目自定义配置欢迎页：

```xml

<web-app>
    <welcom-file-list>
        <welcom-file>login.jsp</welcom-file>
    </welcom-file-list>
</web-app>
```

## JSP概述

`JSP`（全称`Jakarta Server Pages`，曾称为`JavaServer Pages`）是由Sun微系统公司主导建立的一种动态网页技术标准。

!!! note "JSP和Servlet"

    JSP文件在运行时会被其编译器转换成更原始的`Servlet`程序码。`JSP编译器`可以把`JSP文件`转换成用Java程序码写的`Servlet`，然后再由`Java编译器`来编译成能快速执行的二进制机器码，也可以直接编译成二进制码。

JSP将Java程序码和特定变动内容嵌入到静态的页面中，实现以静态页面为模板，动态生成其中的部分内容。

JSP引入了被称为`JSP动作`的XML标签，用来调用内置功能。

另外，可以创建`JSP标签库`，然后像使用标准HTML或XML标签一样使用它们。标签库能增强功能和服务器性能，而且不受跨平台问题的限制。

## Hello World

`.jsp`文件直接编写在`WEB-INF目录`之外，可以直接访问。

``` jsp title="hello_jsp/src/main/webapp/index.jsp"
--8<-- "docs/java_serve/web_application/jsp/hello_jsp/src/main/webapp/index.jsp"
```

Tomcat会将`.jsp`文件编译成`Servlet`。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405221757065.png){ loading=lazy }
  <figcaption>jsp文件被转换为Servlet代码</figcaption>
</figure>

## JSP中的注释

JSP采用这种注释不会被翻译到`Servlet`代码中去：

``` jsp
<%--JSP中的注释--%>
```

## JSP中编写Java代码

### <% %>

JSP中通过`<% %>`添加Java代码，添加的代码会在`service()方法`中执行。

``` jsp
--8<-- "docs/java_serve/web_application/jsp/hello_jsp/src/main/webapp/java_in_jsp1.jsp"
```

### <%= %>

`<%= %>`等价于在`service()方法`中执行`out.write();`

``` jsp
--8<-- "docs/java_serve/web_application/jsp/hello_jsp/src/main/webapp/java_in_jsp2.jsp"
```

### <%! %>

`<%! %>`中的代码会在`service()方法`之外执行。

!!! warning

    一般不常使用，因为Servlet在Tomcat中是单例的，会存在线程安全问题。

``` jsp
--8<-- "docs/java_serve/web_application/jsp/hello_jsp/src/main/webapp/java_in_jsp3.jsp"
```

## JSP内置对象


