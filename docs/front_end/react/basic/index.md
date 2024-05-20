# 基本语法

## 概述

`React` 是一个用于构建交互式用户界面（user interfaces 、UI)的 JavaScript 库。

## 浏览器加载HTML过程

当用户访问一个网页时，服务器会向浏览器返回一个HTML文件，`浏览器`然后读取HTML并构建`文档对象模型（DOM）`。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202405201810128.png){ loading=lazy }
  <figcaption>HTML和DOM</figcaption>
</figure>

!!! note "DOM"

    `DOM` 是 HTML 元素的`对象表示`。它充当您的`代码`和`用户界面`之间的桥梁，并具有类似`树状结构`的父子关系。

    您可以使用`DOM方法`和JavaScript来监听用户事件并通过选择、添加、更新和删除用户界面中的特定元素来操作DOM。

    DOM操作不仅允许您针对特定元素，还可以更改它们的样式和内容。

## js更新UI

通过使用`JavaScript`和`DOM`方法向您的项目添加一个`h1标签`来开始构建我们的项目。

``` html
--8<-- "docs/front_end/react/basic/example/updating_ui_with_javascript.html"
```

<iframe loading="lazy" src="example/updating_ui_with_javascript.html"></iframe>
