---
layout: note
title: 数据结构
nav_order: 10
parent: 数据结构与算法
create_time: 2023/5/18
---

# JDK集合体系

- `java.util.Collection`
    - `java.util.List`:存储有序的可重复的数据
        - `java.util.ArrayList`
        - `java.util.LinkedList`
        - `java.util.Vector`
    - `java.util.Set`:存储无序的不可重复的数据
        - `java.util.HashSet`
            - `java.util.LinkedHashSet`
        - `java.util.TreeSet`
- `java.util.Map`:存储键值对
    - `java.util.HashMap`
        - `java.util.LinkedHashMap`
    - `java.util.TreeMap`
    - `java.util.Hashtable`
        - `java.util.Properties`

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401232140858.png)

# Collection接口

## 抽象方法



# 耗时观察工具

{% highlight java %}
{% include_relative main/java/com/luguosong/util/TimeTool.java %}
{% endhighlight %}

# 🏷️线性结构(List)

`线性结构（线性表）`是具有n个`相同类型元素`的有限`序列`

# 数组（Array）

`数组`是一种`顺序存储`的线性表，所有元素的`内存地址是连续的`。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/628b6f699aa49ffcc9d3c75806457c4a1a66ffe025bb651d9f8e78b4242249b9-4.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/7b17543e4e39ae894bba0b2b6f8431b40d3df04556df06a3b974146d9e5c7d0d-5.png)

{: .warning-title}
> 数组存在的问题
>
> 无法修改容量

## 特征

- 优点
    - 支持随机访问，通过下标访问元素，速度快
    - 内存地址连续，可以通过公式计算内存地址，速度快
- 缺点
    - 无法修改容量
    - 插入和删除元素效率低，需要移动元素
    - 可以使用的方法和属性很少

## 调用

{% highlight java %}
{% include_relative test/java/com/luguosong/ArrayTest.java %}
{% endhighlight %}

# 动态数组（Array List）

为了解决数组容量不可变的问题，我们可以基于`普通数组`自己写一个`动态数组`。

并且，`动态数组`提供了相关操作，如读取元素，查找元素，插入元素，删除元素等。

将公共的接口和不实现的接口封装到父类中：

{% highlight java %}
{% include_relative main/java/com/luguosong/util/list/AbstractList.java %}
{% endhighlight %}

实现剩余方法：

{% highlight java %}
{% include_relative main/java/com/luguosong/util/list/ArrayList.java %}
{% endhighlight %}

# 链表

# 树形结构(Tree)

# 图形结构(Graph)
