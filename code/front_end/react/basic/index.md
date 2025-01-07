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

## JSX

### 简介

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

### JSX中使用大括号

JSX中`大括号`的作用：可以在标签中添加一些 `JavaScript逻辑`或者`引用动态的属性`。

具体有以下功能：

- 动态的指定标签`属性`，通过大括号可以在`属性`中使用`JavaScript 变量`。
- 动态的指定标签`内容`，通过大括号可以在标签中使用`JavaScript 变量`或`表达式`。

``` jsx title="在大括号中使用变量"
export default function Avatar() {
  const avatar = 'https://i.imgur.com/7vQD0fPs.jpg';
  const description = 'Gregorio Y. Zara';
  return (
    <img
      className="avatar"
      src={avatar}
      alt={description}
    />
  );
}
```

``` jsx title="在大括号中使用对象"
export default function TodoList() {
  return (
    <ul style={{
      backgroundColor: 'black',
      color: 'pink'
    }}>
      <li>Improve the videophone</li>
      <li>Prepare aeronautics lectures</li>
      <li>Work on the alcohol-fuelled engine</li>
    </ul>
  );
}
```

!!! warning

	内联 style 属性 使用驼峰命名法编写。例如，HTML `<ul style="background-color: black">` 在你的组件里应该写成 `<ul style={{ backgroundColor: 'black' }}>`。

``` jsx title="在大括号中使用变量"
export default function TodoList() {
  const name = 'Gregorio Y. Zara';
  return (
    <h1>{name}的待办事项列表</h1>
  );
}
```

``` jsx title="在大括号中使用表达式（函数调用）"
const today = new Date();

function formatDate(date) {
  return new Intl.DateTimeFormat(
    'zh-CN',
    { weekday: 'long' }
  ).format(date);
}

export default function TodoList() {
  return (
    <h1>To Do List for {formatDate(today)}</h1>
  );
}
```

``` jsx title="在大括号中使用对象中的属性"
const person = {
  name: 'Gregorio Y. Zara',
  theme: {
    backgroundColor: 'black',
    color: 'pink'
  }
};

export default function TodoList() {
  return (
    <div style={person.theme}>
      <h1>{person.name}'的待办事项</h1>
      <img
        className="avatar"
        src="https://i.imgur.com/7vQD0fPs.jpg"
        alt="Gregorio Y. Zara"
      />
      <ul>
        <li>优化视屏电话</li>
        <li>准备航空学课程</li>
        <li>研究乙醇燃料引擎</li>
      </ul>
    </div>
  );
}
```

## 将Props传递给组件

### 基础概念

每个`父组件`都可以提供`props`给它的`子组件`，从而将一些信息传递给它。

props可以传递任何 JavaScript 值，包括`对象`、`数组`和`函数`。

!!! note

	Props 使你独立思考父组件和子组件。 

	父组件可以改变props，而无需考虑子组件如何使用它们。

	同样，可以改变子组件使用props的方式，不必考虑父组件如何设置它们。

``` jsx title="props_demo.html"
--8<-- "code/front_end/react/basic/example/props_demo.html"
```

<iframe loading="lazy" src="example/props_demo.html"></iframe>

### props默认值

```jsx
/*
    * 属性设置默认值
    * */
function RedText3({color = "red"}) {
    return (
        <p style={{color: color}}>
            Hello,React component!
        </p>
    );
}

/*
   * 父组件
   * */
function MyApp() {
    return (
        <>
            <RedText3/>
        </>
    );
}
```

### 使用展开语法传递 props

有时候，传递 props 会变得非常重复。因为这些组件不直接使用他们本身的任何 props，所以可以使用更简洁的`展开`语法:

```jsx
// Profile中并没有直接使用props属性，代码不够整洁
function Profile({person, size, isSepia, thickBorder}) {
    return (
        <div className="card">
            <Avatar
                person={person}
                size={size}
                isSepia={isSepia}
                thickBorder={thickBorder}
            />
        </div>
    );
}

/*
* 优化后的代码
* 
* 这会将 Profile 的所有 props 转发到 Avatar，而不列出每个名字。
* */
function Profile(props) {
    return (
        <div className="card">
            <Avatar {...props} />
        </div>
    );
}
```

!!! warning "请克制地使用展开语法"

	 如果你在所有其他组件中都使用它，那就有问题了。 通常，它表示你应该拆分组件，并将子组件作为 JSX 传递。 接下来会详细介绍！

### 将JSX作为子组件传递(插槽)

``` jsx title="passing_jsx_as_children.html"
--8<-- "code/front_end/react/basic/example/passing_jsx_as_children.html"
```

<iframe loading="lazy" src="example/passing_jsx_as_children.html"></iframe>

### props是不变的

不要尝试`更改 props`。 props 是 `不可变的`（一个计算机科学术语，意思是“不可改变”）。当一个组件需要改变它的props（例如，响应用户交互或新数据）时，它不得不通过它的父组件传递
`不同的props` —— 一个新对象！它的旧 props 将被丢弃，最终 JavaScript 引擎将回收它们占用的内存。

## 条件渲染

组件会需要根据不同的情况显示不同的内容。

### if语句

``` jsx
function Item({ name, isPacked }) {
  if (isPacked) {
    return <li className="item">{name} ✅</li>;
  }
  return <li className="item">{name}</li>;
}
```

### 三元运算符

相比于if语句，三元运算符减少了很多重复代码。

``` jsx
function Item({name, isPacked}) {
    return (
        <li className="item">
            {isPacked ? name + ' ✅' : name}
        </li>
    );
}
```

对于简单的条件判断，这样的风格可以很好地实现，但需要适量使用。如果你的组件里有很多的嵌套式条件表达式，则需要考虑通过提取为子组件来简化这些嵌套表达式。在
React 里，标签也是你代码中的一部分，所以你可以使用变量和函数来整理一些复杂的表达式。

### 与运算符（&&）

当 `JavaScript && 表达式` 的左侧（我们的条件）为 `true` 时，它则返回其右侧的值。但条件的结果是 `false`，则整个表达式会变成
`false`。在 JSX 里，React 会将 `false` 视为一个`空值`，就像 `null` 或者 `undefined`，这样 React 就不会在这里进行任何渲染。

``` jsx
return (
  <li className="item">
    {name} {isPacked && '✅'}
  </li>
);
```

### 通过变量实现

``` jsx
function Item({ name, isPacked }) {

  let itemContent = name;
  // 不仅可以使用文本，也可以在变量中插入标签
  if (isPacked) {
    itemContent = (
      <del>
        {name + " ✅"}
      </del>
    );
  }
  
  return (
    <li className="item">
      {itemContent}
    </li>
  );
}
```

## 渲染列表

### 列表渲染

``` jsx
const people = [{
  id: 0,
  name: '凯瑟琳·约翰逊',
  profession: '数学家',
}, {
  id: 1,
  name: '马里奥·莫利纳',
  profession: '化学家',
}, {
  id: 2,
  name: '穆罕默德·阿卜杜勒·萨拉姆',
  profession: '物理学家',
}, {
  id: 3,
  name: '珀西·莱温·朱利亚',
  profession: '化学家',
}, {
  id: 4,
  name: '苏布拉马尼扬·钱德拉塞卡',
  profession: '天体物理学家',
}];

export default function List() {
    const listItems = people.map(person =>
        <li key={person.id}>{person.name}</li>
    );
    
    return <ul>{listItems}</ul>;
}
```

### 列表过滤

``` jsx
const people = [{
  id: 0,
  name: '凯瑟琳·约翰逊',
  profession: '数学家',
}, {
  id: 1,
  name: '马里奥·莫利纳',
  profession: '化学家',
}, {
  id: 2,
  name: '穆罕默德·阿卜杜勒·萨拉姆',
  profession: '物理学家',
}, {
  id: 3,
  name: '珀西·莱温·朱利亚',
  profession: '化学家',
}, {
  id: 4,
  name: '苏布拉马尼扬·钱德拉塞卡',
  profession: '天体物理学家',
}];

export default function List() {
	/*
	* 先进行条件过滤
	* */
	const chemists = people.filter(person =>
		person.profession === '化学家'
	);
	
    /*
    * 再进行列表渲染
    * */
	const listItems = chemists.map(person =>
		<li key={person.id}>
			<p>
				<b>{person.name}:</b>
				{' ' + person.profession + ' '}
			</p>
		</li>
	);
	
	return <ul>{listItems}</ul>;
}
```

### key值

直接放在 `map() 方法`里的 `JSX 元素`一般都需要指定` key 值`！

这些 key 会告诉 React，每个组件对应着数组里的哪一项，所以 React 可以把它们匹配起来。这在数组项进行移动（例如排序）、插入或删除等操作时非常重要。一个合适的
key 可以帮助 React 推断发生了什么，从而得以正确地更新 DOM 树。

- key 值在兄弟节点之间必须是唯一的。 不过不要求全局唯一，在不同的数组中可以使用相同的 key。
- key 值不能改变，否则就失去了使用 key 的意义！所以千万不要在渲染时动态地生成 key。

用作 key 的值应该在数据中提前就准备好，而不是在运行时才随手生成。

如果你想让每个列表项都输出多个 DOM 节点而非一个的话，该怎么做呢？
Fragment 语法的简写形式 <> </> 无法接受 key 值，所以你只能要么把生成的节点用一个 `<div>`
标签包裹起来，要么使用长一点但更明确的 <Fragment> 写法：

``` jsx
import { Fragment } from 'react';

// ...

const listItems = people.map(person =>
<Fragment key={person.id}>
<h1>{person.name}</h1>
<p>{person.bio}</p>
</Fragment>
);
```

这里的 Fragment 标签本身并不会出现在 DOM 上，这串代码最终会转换成 `<h1>、<p>、<h1>、<p>…… `的列表。

!!! note "React 中为什么需要 key"

	设想一下，假如你桌面上的文件都没有文件名，取而代之的是，你需要通过文件的位置顺序来区分它们———第一个文件，第二个文件，以此类推。也许你也不是不能接受这种方式，可是一旦你删除了其中的一个文件，这种组织方式就会变得混乱无比。原来的第二个文件可能会变成第一个文件，第三个文件会成为第二个文件……

	React 里需要 key 和文件夹里的文件需要有文件名的道理是类似的。它们（key 和文件名）都让我们可以从众多的兄弟元素中唯一标识出某一项（JSX 节点或文件）。而一个精心选择的 key 值所能提供的信息远远不止于这个元素在数组中的位置。即使元素的位置在渲染的过程中发生了改变，它提供的 key 值也能让 React 在整个生命周期中一直认得它。

!!! warning "使用数组的索引作为 key值"

	你可能会想直接把数组项的索引当作 key 值来用，实际上，如果你没有显式地指定 key 值，React 确实默认会这么做。但是数组项的顺序在插入、删除或者重新排序等操作中会发生改变，此时把索引顺序用作 key 值会产生一些微妙且令人困惑的 bug。

	与之类似，请不要在运行过程中动态地产生 key，像是 `key={Math.random()}` 这种方式。这会导致每次重新渲染后的 key 值都不一样，从而使得所有的组件和 DOM 元素每次都要重新创建。这不仅会造成运行变慢的问题，更有可能导致用户输入的丢失。所以，使用能从给定数据中稳定取得的值才是明智的选择。

	有一点需要注意，组件不会把 key 当作 props 的一部分。Key 的存在只对 React 本身起到提示作用。如果你的组件需要一个 ID，那么请把它作为一个单独的 prop 传给组件：` <Profile key={id} userId={id} />`。

## 保持组件纯粹

### 纯函数

在计算机科学中（尤其是函数式编程的世界中），纯函数 通常具有如下特征：

- `只负责自己的任务。`它不会更改在该函数调用前就已存在的对象或变量。
- `输入相同，则输出相同。`给定相同的输入，纯函数应总是返回相同的结果。

`纯函数`不会改变函数作用域外的变量、或在函数调用前创建的对象——这会使函数变得`不纯粹`！

``` javascript
// double() 就是一个 纯函数。如果你传入 3 ，它将总是返回 6 。
function double(number) {
  return 2 * number;
}
```

⭐React 便围绕着这个概念进行设计。`React 假设你编写的所有组件都是纯函数。`也就是说，对于相同的输入，你所编写的 React
组件必须总是返回相同的 JSX。

React使用纯函数的好处：

- 你的组件可以在不同的环境下运行 — 例如，在服务器上！由于它们针对相同的输入，总是返回相同的结果，因此一个组件可以满足多个用户请求。
- 你可以为那些输入未更改的组件来 跳过渲染，以提高性能。这是安全的做法，因为纯函数总是返回相同的结果，所以可以安全地缓存它们。
- 如果在渲染深层组件树的过程中，某些数据发生了变化，React 可以重新开始渲染，而不会浪费时间完成过时的渲染。纯粹性使得它随时可以安全地停止计算。

### 副作用

以下组件正在读写其外部声明的 guest 变量。这意味着 `多次调用这个组件会产生不同的 JSX`！并且，如果 其他 组件读取 guest
，它们也会产生不同的 JSX，其结果取决于它们何时被渲染！这是无法预测的。

``` jsx
let guest = 0;

function Cup() {
  // Bad：正在更改预先存在的变量！
  guest = guest + 1;
  return <h2>Tea cup for guest #{guest}</h2>;
}

export default function TeaSet() {
  return (
    <>
      <Cup />
      <Cup />
      <Cup />
    </>
  );
}
```

React 提供了`严格模式`，可以用`<React.StrictMode>`包裹根组件引入严格模式。在严格模式下开发时，它将会调用每个组件函数两次。
`通过重复调用组件函数，严格模式有助于找到违反这些规则的组件`。

在 React 中，副作用通常属于 `事件处理程序`。事件处理程序是 React 在你执行某些操作（如单击按钮）时运行的函数。即使事件处理程序是在你的组件
内部 定义的，它们也`不会在渲染期间运行`！ 因此`事件处理程序无需是纯函数`。

如果你用尽一切办法，仍无法为副作用找到合适的事件处理程序，你还可以调用组件中的 `useEffect` 方法将其附加到返回的 JSX 中。这会告诉
React 在渲染结束后执行它。然而，这种方法应该是你最后的手段。

<figure markdown="span">
  ![](https://edrawcloudpubliccn.oss-cn-shenzhen.aliyuncs.com/viewer/self/1059758/share/2025-1-7/1736231321/main.svg){ loading=lazy }
  <figcaption>副作用</figcaption>
</figure>

## 将UI视为树

### 渲染树

`组件`的一个主要特性是能够由`其他组件组合而成`。在 嵌套组件 中有`父组件`和`子组件`的概念，其中每个父组件本身可能是另一个组件的子组件。

当渲染 React 应用程序时，可以在一个称为渲染树的树中建模这种关系。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202501071001094.png){ loading=lazy }
  <figcaption>React 创建的 UI 树是由渲染过的组件构成的，被称为渲染树</figcaption>
</figure>

这棵树由节点组成，每个节点代表一个组件。例如，App、FancyText、Copyright 等都是我们树中的节点。

在 React 渲染树中，根节点是应用程序的 根组件。在这种情况下，根组件是 App，它是 React 渲染的第一个组件。树中的每个箭头从父组件指向子组件。

渲染树表示 React 应用程序的`单个渲染过程`。在 `条件渲染` 中，父组件可以根据传递的数据渲染不同的子组件。

尽管渲染树可能在不同的渲染过程中有所不同，但通常这些树有助于识别 React
应用程序中的顶级和叶子组件。顶级组件是离根组件最近的组件，它们影响其下所有组件的渲染性能，通常包含最多复杂性。叶子组件位于树的底部，没有子组件，通常会频繁重新渲染。

识别这些组件类别有助于理解应用程序的数据流和性能。

### 模块依赖树

当 拆分组件 和逻辑到不同的文件中时，就创建了 JavaScript 模块，在这些模块中可以导出组件、函数或常量。

模块依赖树中的每个节点都是一个模块，每个分支代表该模块中的 import 语句。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202501071033076.png){ loading=lazy }
  <figcaption>模块依赖树</figcaption>
</figure>

树的根节点是根模块，也称为入口文件。它通常包含根组件的模块。

与同一应用程序的渲染树相比，存在相似的结构，但也有一些显著的差异：

- 构成树的节点代表模块，而不是组件。
- 非组件模块，如 inspirations.js，在这个树中也有所体现。渲染树仅封装组件。
- Copyright.js 出现在 App.js 下，但在渲染树中，Copyright 作为 InspirationGenerator 的子组件出现。这是因为
  InspirationGenerator 接受 JSX 作为 children props，因此它将 Copyright 作为子组件渲染，但不导入该模块。

依赖树对于确定运行 React 应用程序所需的模块非常有用。在为生产环境构建 React 应用程序时，通常会有一个构建步骤，该步骤将捆绑所有必要的
JavaScript 以供客户端使用。负责此操作的工具称为 bundler（捆绑器），并且 bundler 将使用依赖树来确定应包含哪些模块。

随着应用程序的增长，捆绑包大小通常也会增加。大型捆绑包大小对于客户端来说下载和运行成本高昂，并延迟 UI
绘制的时间。了解应用程序的依赖树可能有助于调试这些问题。

## 响应事件

### 创建事件处理函数

``` jsx
export default function Button() {
  function handleClick() {
    alert('你点击了我！');
  }

  return (
    <button onClick={handleClick}>
      点我
    </button>
  );
}
```

handleClick是一个`事件处理函数`，`事件处理函数`有如下特点:

- 通常在你的组件 `内部` 定义。
- 名称以 `handle` 开头，后跟事件名称。

或者，你也可以在 JSX 中定义一个内联的事件处理函数：

``` jsx
<button onClick={function handleClick() {
  alert('你点击了我！');
}}>
```

或者，直接使用更为简洁箭头函数：

``` jsx
<button onClick={() => {
alert('你点击了我！');
}}>
```

传递给事件处理函数的函数应直接传递，而非调用。

| 传递一个函数（正确）                                                                 | 调用一个函数（错误❌）                                                                                 |
|----------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| `<button onClick={handleClick}>`                                           | `<button onClick={handleClick()}>`                                                          |
| 在第一个示例中，handleClick 函数作为 onClick 事件处理函数传递。这会让 React 记住它，并且只在用户点击按钮时调用你的函数。 | 第二个示例中，handleClick() 中最后的 () 会在 渲染 过程中 立即 触发函数，即使没有任何点击。这是因为位于 JSX {} 之间的 JavaScript 会立即执行。 |

### 事件处理函数读取props

由于事件处理函数声明于组件内部，因此它们可以直接访问组件的 props。

``` jsx
function AlertButton({ message, children }) {
  return (
    <button onClick={() => alert(message)}>
      {children}
    </button>
  );
}

export default function Toolbar() {
  return (
    <div>
      <AlertButton message="正在播放！">
        播放电影
      </AlertButton>
      <AlertButton message="正在上传！">
        上传图片
      </AlertButton>
    </div>
  );
}
```

### 父组件定义事件处理函数

在父组件中定义子组件的事件处理函数。不同的子组件，最总执行的事件处理函数可能是不同的。为此，将组件从父组件接收的 prop
作为事件处理函数传递。

``` jsx
function Button({onClick, children}) {
    return <button onClick={onClick}>{children}</button>;
}

export default function Toolbar() {
    function handlePlayClick() {
        alert(`正在播放！`);
    }

    return (
        <div>
            <Button onClick={handlePlayClick}>播放电影</Button>
            <Button onClick={() => alert("正在上传！")}>上传图片</Button>
        </div>
    );
}
```

!!! note "命名事件处理函数 prop"

    按照惯例，事件处理函数 props 应该以 on 开头，后跟一个大写字母。

### 事件传播问题

事件处理函数还将捕获任何来自子组件的事件。通常，我们会说事件会沿着树向上`冒泡`或`传播`：它从事件发生的地方开始，然后沿着树向上传播。

在 React 中所有事件都会传播，除了 onScroll，它仅适用于你附加到的 JSX 标签。

```jsx
/*
* 如果你点击任一按钮，它自身的 onClick 将首先执行，
* 然后父级 <div> 的 onClick 会接着执行。
* 因此会出现两条消息。
* 如果你点击 toolbar 本身，
* 将只有父级 <div> 的 onClick 会执行。
* */
export default function Toolbar() {
    return (
        <div className="Toolbar" onClick={() => {
            alert('你点击了 toolbar ！');
        }}>
            <button onClick={() => alert('正在播放！')}>
                播放电影
            </button>
            <button onClick={() => alert('正在上传！')}>
                上传图片
            </button>
        </div>
    );
}
```

调用 `e.stopPropagation()`，阻止事件进一步向上冒泡。

```jsx
export default function Toolbar() {
    return (
        <div className="Toolbar" onClick={() => {
            alert('你点击了 toolbar ！');
        }}>
            <button onClick={e => {
                // 阻止事件向上传播
                e.stopPropagation();
                alert('正在播放！');
            }}>
                播放电影
            </button>

            <button onClick={() => alert('正在上传！')}>
                上传图片
            </button>
        </div>
    );
}
```

也可以让`子组件处理事件`，同时也让`父组件指定一些额外的行为`。与事件传播不同，它并非自动。但使用这种模式的好处是你可以清楚地
`追踪因某个事件的触发而执行的整条代码链`。如果你依赖于事件传播，而且很难追踪哪些处理程序在执行，及其执行的原因，可以尝试这种方法。

``` jsx
function Button({ onClick, children }) {
  return (
    <button onClick={e => {
      e.stopPropagation();
      onClick();
    }}>
      {children}
    </button>
  );
}
```

### 阻止默认行为

某些浏览器事件具有与事件相关联的默认行为。例如，点击 <form> 表单内部的按钮会触发表单提交事件，默认情况下将重新加载整个页面。可以调用事件对象中的
`e.preventDefault()` 来阻止这种情况发生。

- `e.preventDefault()` 阻止少数事件的默认浏览器行为。

!!! warning

    不要混淆`e.stopPropagation()`和`e.preventDefault()`

``` jsx
export default function Signup() {
  return (
    <form onSubmit={e => {
      e.preventDefault();
      alert('提交表单！');
    }}>
      <input />
      <button>发送</button>
    </form>
  );
}
```

### 事件处理函数可以包含副作用

事件处理函数是执行副作用的最佳位置！！！

与渲染函数不同，事件处理函数不需要是 `纯函数`，因此它是用来 更改
某些值的绝佳位置。例如，更改输入框的值以响应键入，或者更改列表以响应按钮的触发。但是，为了更改某些信息，你首先需要某种方式存储它。在
React 中，这是通过 `state`（组件的记忆） 来完成的。

<figure markdown="span">
  ![](https://edrawcloudpubliccn.oss-cn-shenzhen.aliyuncs.com/viewer/self/1059758/share/2025-1-7/1736231321/main.svg){ loading=lazy }
  <figcaption>在事件处理函数中产生副作用</figcaption>
</figure>

## Hook

在 React 中，`useState` 以及任何其他以`use`开头的函数都被称为 `Hook`。

`Hook` 是特殊的函数，只在 React 渲染时有效。它们能让你 `hook` 到不同的 React 特性中去。

!!! warning

    `Hooks` ——`以 use 开头的函数`——`只能在组件或自定义 Hook 的最顶层调用`。 你不能在条件语句、循环语句或其他嵌套函数内调用 Hook。Hook 是函数，但将它们视为关于组件需求的无条件声明会很有帮助。在组件顶部 `use` React 特性，类似于在文件顶部`导入`模块。

## State

`useState` Hook 提供了这两个功能：

- `State 变量` 用于保存渲染间的数据，会保存上次渲染的值。
- `State setter 函数` 更新变量并触发 React 再次渲染组件。

### 案例

``` jsx title="use-state-demo.html"
--8<-- "code/front_end/react/basic/example/use-state-demo.html"
```

<iframe loading="lazy" src="example/use-state-demo.html"></iframe>

点击按钮，会改变对应状态。状态改变组件会重新刷新，同时另一个状态的值不会被重新初始化，而是会被记住。

### 执行过程

``` jsx
const [index, setIndex] = useState(0);
```

1. `组件进行第一次渲染。` 因为你将 `0` 作为 `index` 的初始值传递给 `useState`，它将返回 `[0, setIndex]`。 React 记住 `0`
   是最新的 `state` 值。
2. `你更新了 state。`当用户点击按钮时，它会调用 `setIndex(index + 1)`。 index 是 `0`，所以它是 `setIndex(1)`。这告诉 React
   现在记住 `index` 是 `1` 并触发下一次渲染。
3. `组件进行第二次渲染。`React 仍然看到 `useState(0)`，但是因为 React 记住 了你将 `index` 设置为了 `1`，它将返回
   `[1, setIndex]`。
4. 以此类推！

### React如何知道返回哪个state

组件中调用多次useState方法，组件如何知道哪个方法返回哪个状态的？

```jsx
function MyApp() {
    const [state1, setState1] = useState(0)
    const [state2, setState2] = useState(0)
    const [state3, setState3] = useState(0)
    const [state4, setState4] = useState(0)
    const [state5, setState5] = useState(0)
}
```

`在同一组件的每次渲染中，Hooks 都依托于一个稳定的调用顺序。`因为只在顶层调用 Hooks，Hooks 将始终以相同的顺序被调用。此外，linter
插件也可以捕获大多数错误。

在 React 内部，为每个组件保存了一个数组，其中每一项都是一个 state 对。它维护当前 state 对的索引值，在渲染之前将其设置为
“0”。每次调用 useState 时，React 都会为你提供一个 state 对并增加索引值。

### State是隔离且私有的

State 是屏幕上组件实例内部的状态。换句话说，`如果你渲染同一个组件两次，每个副本都会有完全隔离的 state！`改变其中一个不会影响另一个。

与 props 不同，`state 完全私有于声明它的组件`。父组件无法更改它。这使你可以向任何组件添加或删除 state，而不会影响其他组件。

## 渲染和提交

<figure markdown="span">
  ![](https://edrawcloudpubliccn.oss-cn-shenzhen.aliyuncs.com/viewer/self/1059758/share/2025-1-7/1736231321/main.svg){ loading=lazy }
  <figcaption>渲染和提交</figcaption>
</figure>

### 触发渲染

- 初次渲染
	- 应用启动
	- 调用 createRoot 方法并传入目标 DOM 节点
	- 调用 render 函数触发第一次渲染
- 状态更新时重新渲染
	- 通过使用 set 函数 更新其状态来触发之后的渲染。

更新组件的状态会自动将一次渲染送入队列。

### 渲染过程

渲染过程是`递归的`:如果更新后的组件会返回某个另外的组件，那么 React 接下来就会渲染 那个 组件，而如果那个组件又返回了某个组件，那么
React 接下来就会渲染 那个 组件，以此类推。这个过程会持续下去，直到没有更多的嵌套组件并且 React 确切知道哪些东西应该显示到屏幕上为止。

!!! note "性能问题"

	如果更新的组件在树中的位置非常高，渲染更新后的组件内部所有嵌套组件的默认行为将不会获得最佳性能。如果你遇到了性能问题，性能 章节描述了几种可选的解决方案 。不要过早进行优化！

- 初次渲染
	- React 会调用根组件
	- 为所有标签`创建 DOM 节点`(此时仅仅是创建，还没有add到DOM中)
- 状态更新时重新渲染
	- React 会调用内部状态更新触发了渲染的函数组件。
	- React 将计算它们的哪些属性（如果有的话）自上次渲染以来`已更改`。在下一步`提交阶段`之前，它不会对这些信息执行任何操作(
	  此时仅仅计算变化，并不会更新DOM)。

### 提交到DOM

React 仅在渲染之间存在差异时才会更改 DOM 节点(局部更新DOM节点)。

- 初次渲染
	- React 会使用 `appendChild()` DOM API 将其创建的所有 DOM 节点放在屏幕上。
- 状态更新时重新渲染
	- React 将应用最少的必要操作（在渲染时计算！），以使得 DOM 与最新的渲染输出相互匹配。

### 浏览器绘制

在渲染完成并且 React 更新 DOM 之后，浏览器就会重新绘制屏幕。尽管这个过程被称为`浏览器渲染（browser rendering）`，但我们还是将它称为
`绘制（painting）`，以避免在这些文档的其余部分中出现混淆。

## state如同一张快照

### 渲染会及时生成一张快照

- 开始渲染
- 调用组件函数
- 根据当前渲染时的`state`计算出当前时间点上 UI 的`快照`
- React 会更新界面(DOM)以匹配返回的`快照`

`state`作为一个组件的记忆，不同于在你的函数返回之后就会消失的普通变量。state 实际上`活`在 React 本身中——就像被摆在一个架子上！——
`位于你的组件函数之外`。当 React 调用你的组件时，它会为特定的那一次渲染提供一张 `state快照`。你的组件会在其 JSX
中返回一张包含一整套新的 props 和事件处理函数的 UI 快照 ，其中所有的值都是 根据那一次渲染中 `state` 的值 `被计算出来的`！

请看以下示例：

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 1);
        setNumber(number + 1);
        setNumber(number + 1);
      }}>+3</button>
    </>
  )
}
```

分析以上代码：

1. 第一个`setNumber(number + 1)`被调用：number 是 0 所以 `setNumber(0 + 1)`。
	- React 准备在下一次渲染时将 number 更改为 1。
2. 第二个`setNumber(number + 1)`被调用：number 是0 所以 `setNumber(0 + 1)`。
	- React 准备在下一次渲染时将 number 更改为 1。
3. 第三个`setNumber(number + 1)`被调用：number 是0 所以 `setNumber(0 + 1)`。
	- React 准备在下一次渲染时将 number 更改为 1。

尽管你调用了三次 `setNumber(number + 1)`，但在 这次渲染的 事件处理函数中 `number 会一直是 0`，所以你会三次将 state 设置成
1。这就是为什么在你的事件处理函数执行完以后，React 重新渲染的组件中的 number 等于 1 而不是 3。

#### 示例一

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 5);
        alert(number);
      }}>+5</button>
    </>
  )
}
```

实际执行的是：

``` jsx
setNumber(0 + 5);
alert(0);
```

所有最终输出的是0

#### 示例二

`一个 state 变量的值永远不会在一次渲染的内部发生变化`， 即使其事件处理函数的代码是异步的。

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 5);
        setTimeout(() => {
          alert(number);
        }, 3000);
      }}>+5</button>
    </>
  )
}
```

实际执行的是：

``` jsx
setNumber(0 + 5);
setTimeout(() => {
  alert(0);
}, 3000);
```

因此执行结果依旧是0

## 把一系列state更新加入队列

### React会对state更新进行批处理

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 1);
        setNumber(number + 1);
        setNumber(number + 1);
      }}>+3</button>
    </>
  )
}
```

`React 会等到事件处理函数中的 所有 代码都运行完毕再处理你的 state 更新。` 这就是重新渲染只会发生在所有这些 `setNumber()`
调用 之后 的原因。

这让你可以更新多个 state 变量——甚至来自多个组件的 state 变量——而不会触发太多的 `重新渲染`。

但这也意味着只有在你的事件处理函数及其中任何代码执行完成 之后，UI 才会更新。这种特性也就是 `批处理`，它会使你的 React
应用运行得更快。它还会帮你避免处理只更新了一部分 state 变量的令人困惑的`半成品`渲染。

`React 不会跨多个需要刻意触发的事件（如点击）进行批处理`——每次点击都是单独处理的。请放心，React
只会在一般来说安全的情况下才进行批处理。这可以确保，例如，如果第一次点击按钮会禁用表单，那么第二次点击就不会再次提交它。

### ⭐(难点)在下次渲染前多次更新同一个state

在下次渲染之前多次更新同一个state。

你可以像 `setNumber(n => n + 1)` 这样传入一个根据`队列中的前一个state`计算下一个 state 的 函数，而不是像
`setNumber(number + 1) `这样传入下一个state值。

这是一种告诉 React`用 state 值做某事`而不是仅仅替换它的方法。

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(n => n + 1);
        setNumber(n => n + 1);
        setNumber(n => n + 1);
      }}>+3</button>
    </>
  )
}
```

这样每次点击按钮会增加3

在这里，`n => n + 1` 被称为 `更新函数`。当你将它传递给一个 state 设置函数时：

1. React 会将此函数加入队列，以便在事件处理函数中的所有其他代码运行后进行处理。
2. 在下一次渲染期间，React 会遍历队列并给你更新之后的最终 state。

具体执行过程：

1. `setNumber(n => n + 1)`：`n => n + 1` 是一个函数定义。React 将它加入队列。
2. `setNumber(n => n + 1)`：`n => n + 1` 是一个函数定义。React 将它加入队列。
3. `setNumber(n => n + 1)`：`n => n + 1` 是一个函数定义。React 将它加入队列。

当你在下次渲染期间调用 useState 时，React 会遍历队列。之前的 number state 的值是 0，所以这就是 React 作为参数 n
传递给第一个更新函数的值。然后 React 会获取你上一个更新函数的返回值，并将其作为 n 传递给下一个更新函数，以此类推：

| 更新队列       | n | 返回值       |
|------------|---|-----------|
| n => n + 1 | 0 | 0 + 1 = 1 |
| n => n + 1 | 1 | 1 + 1 = 2 |
| n => n + 1 | 2 | 2 + 1 = 3 |

React 会保存 3 为最终结果并从 useState 中返回。

这就是为什么在上面的示例中点击“+3”正确地将值增加“+3”。

---

再举一个例子：

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 5);
        setNumber(n => n + 1);
      }}>增加数字</button>
    </>
  )
}
```

点击按钮，每次会增加6

这是事件处理函数告诉 React 要做的事情：

1. `setNumber(number + 5)`：number 为 0，所以 setNumber(0 + 5)。React 将 `替换为 5` 添加到其队列中。
2. `setNumber(n => n + 1)`：`n => n + 1` 是一个更新函数。 React 将 该函数 添加到其队列中。

| 更新队列       | n      | 返回值       |
|------------|--------|-----------|
| “替换为 5”    | 0（未使用） | 5         |
| n => n + 1 | 5      | 5 + 1 = 6 |

--- 

再举一个例子

``` jsx
import { useState } from 'react';

export default function Counter() {
  const [number, setNumber] = useState(0);

  return (
    <>
      <h1>{number}</h1>
      <button onClick={() => {
        setNumber(number + 5);
        setNumber(n => n + 1);
        setNumber(42);
      }}>增加数字</button>
    </>
  )
}
```

执行结果为42

以下是 React 在执行事件处理函数时处理这几行代码的过程：

1. `setNumber(number + 5)`：number 为 0，所以 setNumber(0 + 5)。React 将 “替换为 5” 添加到其队列中。
2. `setNumber(n => n + 1)`：n => n + 1 是一个更新函数。React 将该函数添加到其队列中。
3. `setNumber(42)`：React 将 “替换为 42” 添加到其队列中。

在下一次渲染期间，React 会遍历 state 队列：

| 更新队列       |        |           |
|------------|--------|-----------|
| “替换为 5”    | 0（未使用） | 5         |
| n => n + 1 | 5      | 5 + 1 = 6 |
| “替换为 42”   | 6（未使用） | 42        |

总而言之，以下是你可以考虑传递给 setNumber state 设置函数的内容：

- 一个`更新函数`（例如：n => n + 1）会被添加到队列中。
- 任何其他的`值`（例如：数字 5）会导致“替换为 5”被添加到队列中，已经在队列中的内容会被忽略。

事件处理函数执行完成后，React 将触发重新渲染。在重新渲染期间，React 将处理队列。更新函数会在渲染期间执行，因此 `更新函数必须是 纯函数`
并且只 `返回` 结果。不要尝试从它们内部设置 state 或者执行其他副作用。在严格模式下，React 会执行每个更新函数两次（`但是丢弃第二个结果`
）以便帮助你发现错误。

### 更新函数命名惯例

通常可以通过相应 state 变量的第一个字母来命名更新函数的参数：

``` jsx
setEnabled(e => !e);
setLastName(ln => ln.reverse());
setFriendCount(fc => fc * 2);
```

如果你喜欢更冗长的代码，另一个常见的惯例是重复使用完整的 state 变量名称，如 setEnabled(enabled => !enabled)，或使用前缀，如
setEnabled(prevEnabled => !prevEnabled)。

## 更新state中的对象

state 中可以保存任意类型的 JavaScript 值，包括对象。但是，你不应该直接修改存放在 React state 中的对象。相反，当你想要更新一个对象时，你需要
`创建一个新的对象（或者将其拷贝一份），然后将 state 更新为此对象`。

你应该 `把所有存放在 state 中的 JavaScript 对象都视为只读的`。

``` jsx title="❌错误做法"
import {useState} from 'react';

export default function MovingDot() {
    const [position, setPosition] = useState({
        x: 0,
        y: 0
    });
    return (
        <div
            onPointerMove={e => {
                {/*❌没有使用 state 的设置函数，React 并不知道对象已更改。*/
                }
                position.x = e.clientX;
                position.y = e.clientY;
            }}
            style={{
                position: 'relative',
                width: '100vw',
                height: '100vh',
            }}>
            <div style={{
                position: 'absolute',
                backgroundColor: 'red',
                borderRadius: '50%',
                transform: `translate(${position.x}px, ${position.y}px)`,
                left: -10,
                top: -10,
                width: 20,
                height: 20,
            }}/>
        </div>
    );
}
```

``` jsx title="✅正确做法"
import {useState} from 'react';

export default function MovingDot() {
    const [position, setPosition] = useState({
        x: 0,
        y: 0
    });
    return (
        <div
            onPointerMove={e => {
                {/*✅使用 state 的设置函数*/}
                setPosition({
                    x: e.clientX,
                    y: e.clientY
                });
            }}
            style={{
                position: 'relative',
                width: '100vw',
                height: '100vh',
            }}>
            <div style={{
                position: 'absolute',
                backgroundColor: 'red',
                borderRadius: '50%',
                transform: `translate(${position.x}px, ${position.y}px)`,
                left: -10,
                top: -10,
                width: 20,
                height: 20,
            }}/>
        </div>
    );
}

```
