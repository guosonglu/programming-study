# JavaScript简介

## JavaScript简介

JavaScript是一门高级、动态、解释型编程语言，非常适合面向对象和函数式编程风格。

JavaScript从Scheme借鉴了一类（first class）函数，从Self借鉴了基于原型（prototype）的继承。

!!! warning

    JavaScript和Java名称上的相似，是因为Netscape公司希望借Java的名气来推广JavaScript，但事实上两者是完全不同的语言。

## 历史

- 1993年，国家超级计算机应用中心（NCSA）发表了`NCSA Mosaic`，这是最早流行的图形接口网页浏览器，它在万维网的普及上发挥了重要作用。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241420108.png){ loading=lazy }
  <figcaption>NCSA Mosaic网页浏览器</figcaption>
</figure>

- 1994年，Mosaic的主要开发人员创立了`Netscape公司`，并雇用了许多原来的NCSA Mosaic开发者用来开发`Netscape Navigator`
  ，该公司的目标是取代NCSA Mosaic成为世界第一的网页浏览器。

<figure markdown="span">
   ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241421658.png){ loading=lazy }
  <figcaption>Netscape Navigator浏览器</figcaption>
</figure>

- 1995年，网景招募了`布兰登·艾克`，目标是把`Scheme`语言嵌入到`Netscape Navigator`浏览器中。 

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241422313.png){ loading=lazy }
  <figcaption>布兰登·艾克</figcaption>
</figure>

- 网景公司管理层很快决定，最佳的方案是由艾克设计一种新的语言，其语法类似于Java，而不像Scheme或其他现存的脚本语言。1995年5月,`布兰登·艾克`只用了10天就设计完成了这种语言的第一版，名为`Mocha`。
- 1995年9月在Netscape Navigator 2.0的Beta版中改名为`LiveScript`。
- 1995年12月，Netscape Navigator 2.0 Beta 3中部署时被重命名为`JavaScript`。
- 1995年微软公司首次推出`Internet Explorer`，引发了与Netscape的`浏览器大战`。微软对Netscape Navigator解释器进行了逆向工程，创建了`JScript`。JScript也是一种JavaScript实现，这两个JavaScript语言版本在浏览器端共存意味着语言标准化的缺失。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241423825.png){ loading=lazy }
  <figcaption>Internet Explorer</figcaption>
</figure>

- 1996年11月，网景正式向`ECMA（欧洲计算机制造商协会）`提交语言标准。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241424915.png){ loading=lazy }
  <figcaption>ECMA</figcaption>
</figure>

- 1997年6月，`ECMA`以JavaScript语言为基础制定了`ECMAScript标准`规范ECMA-262。JavaScript成为了ECMAScript最著名的实现之一。除此之外，`ActionScript`和`JScript`也都是ECMAScript规范的实现语言。
- 2004年，Netscape的继任者Mozilla发布了`Firefox浏览器`。Firefox受到许多人的好评，从Internet Explorer获得了巨大的市场份额。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241425844.png){ loading=lazy }
  <figcaption>Firefox浏览器</figcaption>
</figure>

- 2005年，Jesse James Garrett发布了一份白皮书，其中他创造了`Ajax`一词，并描述了一套技术，其中JavaScript是骨干，用于创建可以在后台加载数据的Web应用程序，避免了重新加载整页的需要。这引发了JavaScript的复兴时期，由开源库和围绕它们形成的社区带头。创建了许多新库，`包括jQuery`、`Prototype`、`Dojo` `Toolkit`和`MooTools`。
- 2008年，Google发布了`Chrome浏览器`，它使用了一个新的JavaScript引擎`V8`，它在性能上远远超过了其他浏览器。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241425930.png){ loading=lazy }
  <figcaption>Chrome浏览器</figcaption>
</figure>

- 2009年12月发布的`ECMAScript 5`标准。
- Ryan Dahl在2009年创建的`Node.js`引发了Web浏览器之外JavaScript使用的显着增加。Node结合了V8引擎、事件循环和I/O API，从而提供了独立的JavaScript运行时系统。

<figure markdown="span">
  ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401241426301.png){ loading=lazy }
  <figcaption>Node.js</figcaption>
</figure>

- 2015 年`ECMAScript 6`发布。
