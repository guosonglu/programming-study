# 概述

> Java 技术简介，以及安装 Java 开发软件并使用它创建简单程序。

## Java语言概述

> Java技术既是一种`编程语言`，也是一个`平台`。

### Java编程语言

在Java编程语言中，所有源代码首先是以以`.java扩展名`结尾的纯`文本文件`编写的。

这些源文件然后由`javac编译器`编译成`.class文件`。`.class文件`不包含本机于处理器的代码；相反，它包含`字节码`——Java虚拟机（Java VM）的机器语言。

然后，java启动器工具使用`Java虚拟机`的一个实例来运行您的应用程序。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405170956642.png){ loading=lazy }
  <figcaption>软件开发过程概述</figcaption>
</figure>

> 由于Java虚拟机可在许多不同的操作系统上使用，相同的`.class文件`可以在`Microsoft Windows`、`Solaris™操作系统（Solaris OS）`、`Linux`或`Mac OS`上运行。一些虚拟机，如Java SE HotSpot at a Glance，在运行时执行额外的步骤，以提高应用程序的性能。这包括诸如查找性能瓶颈和重新编译（到本机代码）经常使用的代码部分等各种任务。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171000919.png){ loading=lazy }
  <figcaption>通过Java虚拟机，同一个应用程序可以在多个平台上运行</figcaption>
</figure>

### Java平台

`平台`是程序运行的硬件或软件环境。我们已经提到了一些最流行的平台，如Microsoft Windows，Linux，Solaris OS和Mac OS。大多数平台可以描述为`操作系统`和`底层硬件`的组合。

`Java平台`与大多数其他平台不同，因为它是一个仅`基于软件的平台`，可以在其他基于硬件的平台上运行。

Java平台有两个组件：

- `Java虚拟机`:它是Java平台的基础，并且被移植到各种基于硬件的平台上。
- `Java应用程序编程接口（API）`:一个庞大的现成软件组件集合，提供许多有用的功能。它被分组为相关类和接口的库；这些库被称为包。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171005821.png){ loading=lazy }
  <figcaption>API和Java虚拟机使程序与底层硬件隔离</figcaption>
</figure>

> 作为一个独立于平台的环境，Java平台可能比本机代码慢一些。然而，编译器和虚拟机技术的进步正在将性能提升到接近本机代码的水平，而不会威胁可移植性。

## Java能做什么

- `开发工具`：开发工具提供编译、运行、监控、调试和记录应用程序所需的一切。作为新开发者，你将主要使用javac编译器、java启动器和javadoc文档工具。
- `应用程序编程接口（API）`：API提供Java编程语言的核心功能。它包含大量可供应用的有用类，涵盖从基本对象到网络和安全、XML生成和数据库访问等各个方面。核心API非常庞大，概览其内容可查阅Java平台标准版8文档。
- `部署技术`：JDK软件提供标准机制，如Java Web Start软件和Java Plug-In软件，用于将应用程序部署给最终用户。
- `用户界面工具包`：JavaFX、Swing和Java 2D工具包使创建复杂的图形用户界面（GUI）成为可能。
- `集成库`：集成库如Java IDL API、JDBC API、Java命名和目录接口（JNDI）API、Java RMI以及基于Internet Inter-ORB协议技术的Java远程方法调用（Java RMI-IIOP技术）支持数据库访问和远程对象操作。

## Java 技术会如何改变我的生活？

如果你学习Java编程语言，我们不能保证给你名声、财富，甚至工作。但它很可能会让你的程序更好，而且比其他语言需要更少的努力。我们相信Java技术将帮助你做到以下几点：

- `快速入门`：尽管Java编程语言是一种强大的面向对象语言，但它很容易学习，特别是对于已经熟悉C或C++的程序员。
- `减少代码编写`：程序指标（类计数、方法计数等）的比较表明，用Java编程语言编写的程序可以比用C++编写的同一程序小四倍。
- `编写更好的代码`：Java编程语言鼓励良好的编码实践，自动垃圾回收有助于避免内存泄漏。它的面向对象特性、JavaBeans组件架构以及广泛且易扩展的API使你可以重用已有的、经过测试的代码，从而引入更少的错误。
- `更快地开发程序`：Java编程语言比C++更简单，因此用Java编写程序的开发时间可能会快一倍。你的程序也将需要更少的代码行数。
- `避免平台依赖`：通过避免使用其他语言编写的库，可以使你的程序保持可移植性。
- `一次编写，到处运行`：由于用Java编程语言编写的应用程序被编译成与机器无关的字节码，它们可以在任何Java平台上一致地运行。
- `更轻松地分发软件`：使用Java Web Start软件，用户只需点击鼠标即可启动你的应用程序。启动时的自动版本检查确保用户始终使用最新版本的软件。如果有更新，Java Web Start软件会自动更新他们的安装。

## JDK和JRE

 `JRE`提供了`库`、`Java虚拟机`和其他组件，使您能够`运行`用Java编程语言编写的小程序和应用程序。这个运行时环境可以与应用程序一起重新分发，使它们能够独立运行。

 `JDK`包括JRE以及`命令行开发工具`，如`编译器`和`调试器`，这些工具对于开发小程序和应用程序是必要或有用的。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171033487.png){ loading=lazy }
  <figcaption>JavaSE组成</figcaption>
</figure>

## 安装JDK

### JDK8安装

- 官方[下载](https://www.oracle.com/java/technologies/downloads/archive/)JDK安装包

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171115926.png){ loading=lazy }
  <figcaption>点击下一步</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171117183.png){ loading=lazy }
  <figcaption>选择安装路径（路径不要包含中文）</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171118869.png){ loading=lazy }
  <figcaption>选择JRE安装路径</figcaption>
</figure>

!!! warning

    JDK内部其实已经包含JRE了，选择安装JRE会安装两份JRE。不想安装可以直接将对话框叉掉。

- 配置`JAVA_HOME`环境变量

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171124604.png){ loading=lazy }
  <figcaption>配置JAVA_HOME环境变量</figcaption>
</figure>

!!! note

    Tomcat会用到`JAVA_HOME`环境变量

- 配置path环境变量

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171127008.png){ loading=lazy }
  <figcaption>配置path环境变量</figcaption>
</figure>

### JDK17安装

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171346284.png){ loading=lazy }
  <figcaption>点击下一步</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171347268.png){ loading=lazy }
  <figcaption>选择安装路径</figcaption>
</figure>

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405171351611.png){ loading=lazy }
  <figcaption>安装完成</figcaption>
</figure>

!!! note

    JDK17安装过程中会自动进行环境变量配置。

    但不会创建`JAVA_HOME`,还需手动创建。

## Windows中Hello World

- 创建`HelloWorldApp.java`文本文件

``` java
--8<-- "docs/java/javase/src/main/java/com/luguosong/overview/HelloWorldApp.java"
```

- 切换到java文件目录，编译文件,得到`HelloWorldApp.class`:

```shell
javac HelloWorldApp.java
```

- 执行程序：

```shell
java -cp ../../../ com.luguosong.overview.HelloWorldApp

# 如果源码中不带包名，直接输入以下命令运行即可
java -cp . HelloWorldApp
```

