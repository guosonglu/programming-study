# 基本语法

## 概述

`React` 是一个用于构建交互式用户界面（user interfaces 、UI)的 JavaScript 库。

## 浏览器加载HTML过程

当用户访问一个网页时，服务器会向浏览器返回一个HTML文件，`浏览器`然后读取HTML并构建`文档对象模型（DOM）`。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202405201810128.png){ loading=lazy }
  <figcaption>HTML和DOM</figcaption>
</figure>

!!! note "DOM"

    `DOM` 是 HTML 元素的`对象表示`。它充当您的`代码`和`用户界面`之间的桥梁，并具有类似`树状结构`的父子关系。

    您可以使用`DOM方法`和JavaScript来监听用户事件并通过选择、添加、更新和删除用户界面中的特定元素来操作DOM。

    DOM操作不仅允许您针对特定元素，还可以更改它们的样式和内容。

## js更新UI

通过使用`JavaScript`和`DOM`方法向您的项目添加一个`h1标签`来开始构建我们的项目。

``` html title="updating_ui_with_javascript.html"
--8<-- "docs/front_end/react/basic/example/updating_ui_with_javascript.html"
```

<iframe loading="lazy" src="example/updating_ui_with_javascript.html"></iframe>

!!! danger

    使用纯JavaScript更新DOM非常强大但冗长。您已经编写了所有这些代码来添加一个带有一些文本的`<h1>`元素。

## 命令式编程vs声明式编程

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

## React概述

React 是一个流行的`声明式`库，您可以使用它来构建用户界面。

> 用户界面由`按钮`、`文本`和`图像`等小单元内容构建而成。React帮助你把它们组合成可重用、可嵌套的`组件`。

## JSX简介

`JSX`（JavaScript
XML，正式称为JavaScript语法扩展）是JavaScript语言语法的类似XML的扩展。最初由Facebook创建以用于React，JSX已被多个Web框架采用。作为一种`语法糖`
，JSX通常被转译成类似于原始JSX的嵌套JavaScript函数调用。

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

在JSX中编写的代码需要使用诸如`Babel`之类的工具进行转换，以便能够被`Web浏览器`理解。这种处理通常是在软件`构建`
过程中进行的，在应用程序部署之前。

## React入门案例

### 纯Html

``` html title="hello_react.html"
--8<-- "docs/front_end/react/basic/example/hello_react.html"
```

<iframe loading="lazy" src="example/hello_react.html"></iframe>

### Create React App

Create React App 是官方支持的创建单页 React 应用程序的方式。它提供了一个现代的构建设置，无需配置。

```shell
# 创建React项目
npx create-react-app hello-react

#不建议使用 create-react-app 创建 React 应用程序。在没有框架的情况下使用 React 时，首选方式是使用带Vite Bundler 的模板。
npm create vite@latest hello-react -- --template react
```

``` html title="index.html"
--8<-- "source/front_end/react/basic/hello-react/public/index.html"
```

``` javascript title="index.js"
--8<-- "source/front_end/react/basic/hello-react/src/index.js"
```

## 组件(component)

用户界面可以分解为称为`组件`（ 应用程序中可复用的 UI 元素）的较小构建块。

> 组件允许您构建独立的、可重复使用的代码片段。如果您将组件视为乐高积木，您可以将这些单独的积木组合在一起，形成更大的结构。如果您需要更新UI的某个部分，您可以更新特定的组件或积木。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202405231353523.png){ loading=lazy }
  <figcaption>组件</figcaption>
</figure>

这种`模块化`使得您的代码在不断增长时更易于维护，因为您可以添加、更新和删除组件而不影响我们应用程序的其他部分。

React组件是一段可以使用标签进行扩展的JavaScript`函数`。在函数的返回语句中，你可以编写`JSX`。

React组件应该`大写`以区分它们与普通的HTML和JavaScript。

您可以像使用常规HTML标签一样使用React组件，使用尖括号。

``` html title="hello_components.html"
--8<-- "docs/front_end/react/basic/example/hello_components.html"
```

<iframe loading="lazy" src="example/hello_components.html"></iframe>

## 组件导出和导入

将组件封装在`单独的文件`中导出，更加有利于组件的复用。

使用`export default`导出组件：

``` jsx
function Profile() {
  return (
    <img
      src="https://i.imgur.com/QIrZWGIs.jpg"
      alt="Alan L. Hart"
    />
  );
}

export default function Gallery() {
  return (
    <section>
      <h1>了不起的科学家们</h1>
      <Profile />
      <Profile />
      <Profile />
    </section>
  );
}
```

使用`import`导入组件：

```jsx
import Gallery from './Gallery.js';

export default function App() {
  return (
    <Gallery />
  );
}
```

## Props

常规的HTML元素具有`属性`，您可以使用这些属性传递信息片段，从而`改变这些元素的行为`。

> 例如，更改元素的`src属性`会更改显示的图像。更改标签的href属性会更改链接的目的地。

同样地，您可以将信息片段作为属性传递给React组件。这些被称为`props`。

