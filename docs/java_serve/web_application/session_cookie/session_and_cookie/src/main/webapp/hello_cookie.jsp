<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: 10545
  Date: 2024/5/27
  Time: 上午11:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <%
        PrintWriter writer = response.getWriter();
        writer.println("当前Cookie：");
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            writer.println(cookie.getName());
            writer.println(cookie.getValue() + ";  ");
        }
    %>
</div>
<a href="addCookie">添加Cookie</a>
</body>
</html>
