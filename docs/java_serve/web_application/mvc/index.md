# MVC架构模式

## 不使用MVC模式存在的问题

- 不使用MVC模式，Servlet需要负责`数据接收`、`核心业务逻辑处理`、`数据库连接和增删改查操作`、`页面展示`等功能。职责过重。
- 代码的`复用性差`，相同的业务操作或数据库操作，需要在不同Servlet中编写重复代码，不方便维护。
- 代码`耦合度高`，导致代码很难扩展。
- 操作数据库的代码和处理业务逻辑的代码混杂在一起，很容易出错，无法专注于业务逻辑的编写。

## MVC模式概述

- `M(Model、模型)`:用于处理业务
- `V(View、视图)`:负责页面展示
- `C(Controller、控制器)`:控制器是MVC架构的核心，

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/diagrams/java_serve/web_application/mvc/MVC%E6%9E%B6%E6%9E%84%E6%A8%A1%E5%BC%8F.svg){ loading=lazy }
  <figcaption>MVC架构图解</figcaption>
</figure>

!!! note "DAO(Data Access Object、数据访问对象)"

    属于JavaEE的设计模式之一。只负责数据库的增删改查，没有任何业务逻辑在里面

## 三层架构

- `表示层`：Controller控制器+View视图
- `业务逻辑层`：Service服务
- `持久化层`：DAO数据访问对象
