---
layout: note
title: React
nav_order: 50
create_time: 2023/6/29
---

# 🏷️描述UI

React 是一个用于构建用户界面（UI）的 JavaScript 库，用户界面由按钮、文本和图像等小单元内容构建而成。React
帮助你把它们组合成`可重用`、`可嵌套`的组件。从 web 端网站到移动端应用，屏幕上的所有内容都可以被分解成组件。

# 定义组件

{% highlight react %}
{% include_relative src/views/describing-the-ui/defining-a-component/FCom.js %}
{% endhighlight %}

# 使用组件

{% highlight react %}
{% include_relative src/views/describing-the-ui/using-a-component/FCom.js %}
{% endhighlight %}

# 组件的导入与导出

导出组件：

```javascript
export default xxx
```

导入组件：

```javascript
import xxx from 'xxx'
```

# JSX

React组件使用一种被称为`JSX`的语法扩展来描述这些标签。JSX看起来和HTML很像，但它的语法更加严格并且可以动态展示信息。

JSX规则：

- 只能返回一个根元素
- 标签必须闭合
- 使用驼峰式命名法给~~所有~~大部分属性命名！
- 在 JSX 中通过`大括号`使用 JavaScript

# Props属性

每个父组件都可以提供 props 给它的子组件，从而将一些信息传递给它。

{% highlight react %}
{% include_relative src/views/describing-the-ui/passing-props-to-a-component/FCom.js %}
{% endhighlight %}

# 插槽

{% highlight react %}
{% include_relative src/views/describing-the-ui/slot/CCom.js %}
{% endhighlight %}

# 条件渲染

{% highlight react %}
{% include_relative src/views/describing-the-ui/conditional-rendering/FCom.js %}
{% endhighlight %}

# 列表渲染

使用`map`函数渲染列表。使用`filter`函数过滤列表。使用`key`属性来标识列表项。

{% highlight react %}
{% include_relative src/views/describing-the-ui/rendering-lists/FCom.js %}
{% endhighlight %}

# 🏷️添加交互

界面上的控件会根据用户的输入而更新。例如，点击按钮切换轮播图的展示。在 React 中，随时间变化的数据被称为状态（state）。你可以向任何组件添加状态，并按需进行更新。

# 响应事件

{% highlight react %}
{% include_relative src/views/adding-interactivity/responding-to-events/FCom.js %}
{% endhighlight %}

# state

{: .note-title}
> 普通变量和state的区别
>
> - `局部变量`无法在多次渲染中持久保存，当React再次渲染这个组件时，它会重新初始化这个变量。而`state`可以在多次渲染中持久保存。
> - 更改`局部变量`不会触发渲染。而更改`state`会触发渲染。

{% highlight react %}
{% include_relative src/views/adding-interactivity/state-a-components-memory/FCom.js %}
{% endhighlight %}

# 原理：渲染和提交

组件请求和提供UI的过程如下：

1. 触发一次渲染
    1. 组件的`初次渲染`。
    2. 组件（或者其祖先之一）的`状态`发生了改变。
2. 渲染组件
    1. 在进行初次渲染时, React 会调用根组件。
    2. 对于后续的渲染, React 会调用内部状态更新触发了渲染的函数组件。
    3. 如果当前组件包含子组件，会一直渲染到最底层的子组件。
3. 提交到DOM
    1. 对于初次渲染， React 会使用 `appendChild()` DOM API 将其创建的所有 DOM 节点放在屏幕上。
    2. 对于重渲染， React 将应用最少的必要操作（在渲染时计算！），以使得 DOM 与最新的渲染输出相互匹配。

{: .warning}
> React仅在渲染之间存在差异时才会`更改DOM`节点。如下面组件，当time属性变化时，并`不会更新input标签`：
>
> ```react
> export default function Clock({ time }) {
>   return (
>     <>
>       <h1>{time}</h1>
>       <input />
>     </>
>   );
> }
> ```

# state如同快照

当对状态进行修改时，状态并不会立刻改变，而是生成一个快照。等到下一次渲染时，才会将快照中的状态更新到组件中：

{% highlight react %}
{% include_relative src/views/adding-interactivity/state-as-a-snapshot/FCom.js %}
{% endhighlight %}

# state更新加入队列

在下次渲染之前多次更新同一个 state。

将`更新函数`传递给一个 state 设置函数时：
1. React 会将此函数加入队列，以便在对应处理函数中的所有其他代码运行后进行处理。
2. 在下一次渲染期间，React 会遍历队列并给你更新之后的最终 state。

当你在下次`渲染期间`调用 useState 时，React 会遍历队列。先获取`之前state的值`作为`参数 n `传递给第一个更新函数的值。然后 React 会获取你上一个更新函数的`返回值`，并将其作为 `n` 传递给下一个更新函数，以此类推。


{% highlight react %}
{% include_relative src/views/adding-interactivity/queueing-a-series-of-state-updates/FCom.js %}
{% endhighlight %}

# 更新对象类型state

当你想要更新一个对象时，你需要创建一个新的对象（或者将其拷贝一份），然后将 state 更新为此对象。

{% highlight react %}
{% include_relative src/views/adding-interactivity/updating-objects-in-state/FCom.js %}
{% endhighlight %}

# 更新数组类型state

{% highlight react %}
{% include_relative src/views/adding-interactivity/updating-arrays-in-state/FCom.js %}
{% endhighlight %}

# 🏷️状态管理

随着你的应用不断变大，更有意识的去关注应用状态如何组织，以及数据如何在组件之间流动会对你很有帮助。冗余或重复的状态往往是缺陷的根源。

# 声明式编程

命令式编程和声明式编程：
- `命令式编程`：必须去根据要发生的事情写一些明确的命令去操作UI
- `声明式编程`：只需要告诉React你想要的结果，React会自动帮你处理

{% highlight react %}
{% include_relative src/views/managing-state/reacting-to-input-with-state/FCom.js %}
{% endhighlight %}

# state构建原则

构建state的原则:
- 合并关联的 state
- 避免互相矛盾的 state
- 避免冗余的state:如果你能在渲染期间从组件的 props 或其现有的 state 变量中计算出一些信息，则不应将这些信息放入该组件的 state 中。
- 避免重复的state
- 避免深度嵌套的 state

# 共享状态：状态提升

希望两个组件的状态始终同步更改,可以将相关 state 从这两个组件上移除，并把 state 放到它们的公共父级，再通过 props 将 state 传递给这两个组件。

{% highlight react %}
{% include_relative src/views/managing-state/sharing-state-between-components/FCom.js %}
{% endhighlight %}

# 受控组件

当组件中的重要信息是由`props`而不是其自身`状态`驱动时，就可以认为该组件是`受控组件`。这就允许父组件完全指定其行为。

`非受控组件`的特点是简单，不需要太多配置。

而`受控组件`的特点是灵活，需要父组件使用 props 对其进行配置。

{: .warning-title}
> 可信单一数据源
> 
> 对于每个独特的状态，都应该存在且只存在于一个指定的组件中作为 state。

# 对state进行保留和重置

每个组件都有完全独立的state,互不影响。

- 组件停止渲染，state状态会被清除
- 相同位置的相同组件（比如只是属性不一样），状态会被保留
- 相同位置的不同组件，state状态会被清除(包含它下面的子组件的state也会被清理)

相同位置相同组件重置组件(特殊情况):
- 将组件渲染在不同的位置
- 使用 key 来重置 state

{: .note}
> `如果你想在重新渲染时保留 state，几次渲染中的树形结构就应该相互“匹配”`。结构不同就会导致 state 的销毁，因为 React 会在将一个组件从树中移除时销毁它的 state。

{% highlight react %}
{% include_relative src/views/managing-state/preserving-and-resetting-state/FCom.js %}
{% endhighlight %}

# Reducer

`Reducer`将组件的所有`状态更新`逻辑整合到一个外部函数中。

{% highlight react %}
{% include_relative src/views/managing-state/extracting-state-logic-into-a-reducer/FCom.js %}
{% endhighlight %}

# Context深层传递参数

通常来说，你会通过 props 将信息从父组件传递到子组件。但是，如果你必须通过许多中间组件向下传递 props，或是在你应用中的许多组件需要相同的信息，传递 props 会变的十分冗长和不便。`Context`允许父组件向其下层无论多深的任何组件提供信息，而无需通过 props 显式传递。

{% highlight react %}
{% include_relative src/views/managing-state/passing-data-deeply-with-context/FCom.js %}
{% endhighlight %}

# Reducer+Context

可以将Reducer和Context整合到一个文件中，方便管理：

{% highlight react %}
{% include_relative src/views/managing-state/scaling-up-with-reducer-and-context/CountProvider.js %}
{% endhighlight %}

然后将组件包裹在Provider中：

{% highlight react %}
{% include_relative src/views/managing-state/scaling-up-with-reducer-and-context/FCom.js %}
{% endhighlight %}

# 🏷️应急方案

# ref

当你希望组件记住某些信息，但又不想让这些信息`触发新的渲染`时，你可以使用`ref`。

与`state`类似，ref能在渲染之间保留，但是不会触发渲染。


