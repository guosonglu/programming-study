# 基本语法

## React概述

React 是一个流行的`声明式`库，您可以使用它构建交互式用户界面（user interfaces 、UI)。

> 用户界面由`按钮`、`文本`和`图像`等小单元内容构建而成。React帮助你把它们组合成可重用、可嵌套的`组件`。

## 使用React的好处

### 浏览器加载HTML过程

当用户访问一个网页时，服务器会向浏览器返回一个HTML文件，`浏览器`然后读取HTML并构建`文档对象模型（DOM）`。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202405201810128.png){ loading=lazy }
  <figcaption>HTML和DOM</figcaption>
</figure>

!!! note "DOM"

    `DOM` 是 HTML 元素的`对象表示`。它充当您的`代码`和`用户界面`之间的桥梁，并具有类似`树状结构`的父子关系。

    您可以使用`DOM方法`和JavaScript来监听用户事件并通过选择、添加、更新和删除用户界面中的特定元素来操作DOM。

    DOM操作不仅允许您针对特定元素，还可以更改它们的样式和内容。

### 命令式-js更新UI

通过使用`JavaScript`和`DOM`方法向您的项目添加一个`h1标签`来开始构建我们的项目。

``` html title="updating_ui_with_javascript.html"
--8<-- "code/front_end/react/basic/example/updating_ui_with_javascript.html"
```

<iframe loading="lazy" src="example/updating_ui_with_javascript.html"></iframe>

!!! danger

    使用纯JavaScript更新DOM非常强大但冗长。您已经编写了所有这些代码来添加一个带有一些文本的`<h1>`元素。

### 命令式编程vs声明式编程

上面使用DOM操作元素的代码是`命令式编程`的一个很好的例子。

> 命令式编程就像给厨师逐步指示如何制作披萨。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202405211656281.png){ loading=lazy }
  <figcaption>命令式编程</figcaption>
</figure>

而在`声明式编程`中，开发人员可以声明他们想要显示的内容，而不必编写DOM方法会很有帮助。

> 声明式编程就像订购披萨而不必担心制作披萨的步骤。🍕

React 是一个流行的`声明式库`，您可以使用它来构建用户界面。作为开发者，你可以告诉React你想要用户界面发生什么变化，React会自动计算出如何更新DOM的步骤。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202405211657199.png){ loading=lazy }
  <figcaption>声明式编程</figcaption>
</figure>

## React入门案例

### 纯Html

``` html title="hello_react.html"
--8<-- "code/front_end/react/basic/example/hello_react.html"
```

<iframe loading="lazy" src="example/hello_react.html"></iframe>

### Create React App

Create React App 是官方支持的创建单页 React 应用程序的方式。它提供了一个现代的构建设置，无需配置。

```shell
# 创建React项目
npx create-react-app hello-react
```

``` html title="index.html"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>React App</title>
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
```

``` javascript title="index.js"
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);

reportWebVitals();
```

### 使用vite创建项目

```shell
# 使用vite创建react项目
npm create vite@latest my-vue-app -- --template react
# 或
yarn create vite my-vue-app --template react
```

## 组件入门

React 组件是一段可以 使用标签进行扩展 的 JavaScript 函数，是用程序中可复用的 UI 元素。

``` html title="hello_component.html"
--8<-- "code/front_end/react/basic/example/hello_component.html"
```

<iframe loading="lazy" src="example/hello_component.html"></iframe>

## JSX简介

`JSX`（JavaScript XML，正式称为JavaScript语法扩展）是JavaScript语言语法的类似XML的扩展。最初由Facebook创建以用于React，JSX已被多个Web框架采用。

将`渲染逻辑`和`标签`共同存放在组件中。可以让js更好的控制HTML内容。

JSX 规则：

- 只能返回一个根元素
- 标签必须闭合，像 `<img>` 这样的自闭合标签必须书写成 `<img />`
- 使用驼峰式命名法给大部分属性命名！

!!! warning

	由于历史原因，`aria-*` 和 `data-*` 属性是以带 `-` 符号的 HTML 格式书写的。

JSX代码示例:

```jsx
const App = () => {
    return (
        <div>
            <p>Header</p>
            <p>Content</p>
            <p>Footer</p>
        </div>
    );
}
```

!!! note

	在JSX中编写的代码需要使用诸如`Babel`之类的工具进行转换，以便能够被`Web浏览器`理解。这种处理通常是在软件`构建`
	过程中进行的，在应用程序部署之前。

## JSX中使用大括号

