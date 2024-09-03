# 词法结构

## JavaScript程序的文本

- 区分大小写
- 忽略空格，换行，制表符
- 将`换行符`、`回车符`和`回车 / 换行序列`视为`行终止符`

## 注释

```javascript
// 这是单行注释

/* 这也是注释 */ //而这是另一个注释

/*
 * 这是多行注释
 * 每行开头额外的*字符不是必须的，只是为了美观
 */
```

## 字面量

`字面量`是一种直接出现在程序中的数据值。

```javascript
12 // 数值12
1.2 // 数值1.2
"hello world" // 字符串
"Hi" // 另一个字符串
true // 布尔值
false // 另一个布尔值
null // 无对象
```

## 标识符和保留字

`标识符`是指变量、函数、属性的名字，或者函数的参数。

- 第一个字符必须是一个字母、下划线（_）或一个美元符号（$）
- 其他字符可以是字母、下划线、美元符号或数字

JavaScript为语言自身使用保留了一些标识符，这些`保留字`不能用作常规标识符。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202401241455861.png){ loading=lazy }
  <figcaption>标识符</figcaption>
</figure>

还有一些保留字，虽然目前没有用到，但是未来可能会用到，所以也不要使用。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202401241456789.png){ loading=lazy }
  <figcaption>保留字</figcaption>
</figure>

由于历史原因，某些情况下也不允许使用arguments和eval作为标识符。

其中from、set、target虽然是保留字，但还是可以作为标识符使用。

## Unicode

Unicode转义序列：使用ASCII字符来表示Unicode字符。

```javascript
console.log("\u4F60\u597D") //你好
//ES6增加了带花括号的版本，用于表示超过0xFFFF的字符
console.log("\u{1F600}") //😀
```

!!! warning

    Unicode允许使用多种不同的方式来表示同一个字符。JavaScript底层认为它们是不同的。

    JavaScript不会执行任何归一化，开发者应确保自己的编辑器对自己的源码执行Unicode归一化。以防其中包含看起来一样但实际不同的标识符。

    例如：`café`可以表示为`café`或`cafe\u0301`，这两种表示法在JavaScript中是不同的。

## 可选的分号

- 如果语句位于两行，之间的分号可以省略

```javascript
a = 3
b = 4
```

- 如果语句位于一行，则分号不能省略：

```
a = 3; b = 4
```

换行符并非每次都会解释为分号，只在它后面的内容无法解释为有效的语句时才会这样做。

```javascript
let a
a
  =
  3
console.log(a) // 3

//上面代码等价于
let a
a = 3
console.log(a) // 3
```

!!! warning
    
     - 一定不能在return、break或continue语句的后面换行，否则会自动插入分号，导致return、break或continue语句失效。
     - 一定不能在`++`或`--`运算符的后面换行，否则会自动插入分号，导致`++`或`--`运算符失效。
