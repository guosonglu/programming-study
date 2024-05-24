# Session和Cookie

## Session入门案例

``` jsp
--8<-- "docs/java_serve/web_application/session_cookie/session_and_cookie/src/main/webapp/hello_session.jsp"
```

``` java
--8<-- "docs/java_serve/web_application/session_cookie/session_and_cookie/src/main/java/com/luguosong/AddSession.java"
```

``` java
--8<-- "docs/java_serve/web_application/session_cookie/session_and_cookie/src/main/java/com/luguosong/DeleteSession.java"
```

## Session原理图解

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/web_application/session_cookie/session%E5%8E%9F%E7%90%86%E5%9B%BE%E8%A7%A3.svg){ loading=lazy }
  <figcaption>Session原理图解</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405241645997.png){ loading=lazy }
  <figcaption>第一次访问Servlet，服务端会返回Set-Cookie响应头。浏览器会将JSESSIONID存储到Cookie中去</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405241647182.png){ loading=lazy }
  <figcaption>后续访问，请求头Cookie会携带JSESSIONID信息</figcaption>
</figure>

## Session过期时间

Session的默认超时时间是30分钟。

可以在Web.xml中进行自定义配置：

``` xml title="web.xml"
--8<-- "docs/java_serve/web_application/session_cookie/session_and_cookie/src/main/webapp/WEB-INF/web.xml"
```

!!! note

    每次访问Servlet，Session的剩余超时时间都会刷新。
