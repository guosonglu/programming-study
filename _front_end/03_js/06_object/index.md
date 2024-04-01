---
layout: note
title: 对象
nav_order: 60
parent: JavaScript
create_time: 2024/3/7
---

# 对象概述

- 字符串到值的映射
- 可以从其它对象（原型）继承属性
- 可以动态的添加和删除属性
- 对象是可修改的，是按引用操作而不是按值操作
- 属性除了名字和值以外，还有3个属性特性：writable(可写)、enumerable(可枚举)、configurable(可配置)

# 创建对象

{% highlight html %}
{% include_relative create_object.html %}
{% endhighlight %}

# 属性的查询和设置

```javascript
let book = {
    "main title": "Professional JavaScript",
    authors: "Nicholas C. Zakas",
  }

  //创建或设置属性
  book.edition = 3
  book["main title"] = "Professional JavaScript 3rd Edition"

  //属性访问
  console.log(book.authors) // 通过点（.）操作符访问
  console.log(book["main title"]) // 通过方括（[]）号访问
```

属性的继承：

```javascript
// 属性的继承
let o = {}
o.x = 1
let p = Object.create(o)
p.y = 2
let q = Object.create(p)
q.z = 3
q.x = 4 // 新创建的同名属性会隐藏继承自原型对象的属性
console.log(q)
console.log(q.x) // 4
```

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202403111410978.png)

{: .note}
> 查询属性会用到原型链，修改属性则不会影响原型链

# 删除属性

`delete操作符`只删除自有属性，不会删除继承属性

```javascript
let o = {x: 1}
console.log(delete o.x) // true
```

# 测试属性

```javascript
let o = { x: 1 }

// in操作符
"x" in o // true
"y" in o // false
"toString" in o // true，继承属性也返回true

// hasOwnProperty方法
o.hasOwnProperty("x") // true
o.hasOwnProperty("y") // false
o.hasOwnProperty("toString") // false,如果是继承属性返回false

// propertyIsEnumerable方法
o.propertyIsEnumerable("x") // true
o.propertyIsEnumerable("toString") // false，toString不是自有属性
Object.prototype.propertyIsEnumerable("toString") // false,toString不可以枚举

// 使用 !==
o.x !== undefined // true
o.y !== undefined // false
o.toString !== undefined // true
```

# 枚举属性

{% highlight html %}
{% include_relative enumerating-properties.html %}
{% endhighlight %}

<iframe src="enumerating-properties.html"></iframe>

# 扩展对象

```javascript
let dest, src, result
dest = {}
src = { id: "src" }
result = Object.assign(dest, src)
console.log(dest) // { id: "src" }
```

# 序列化

序列化：将对象转换为字符串

```javascript
let o ={
    x: 1,
    y: {z: [false, null, ""]},
}
let s = JSON.stringify(o) // '{"x":1,"y":{"z":[false,null,""]}}' 序列化
let p = JSON.parse(s) // {x: 1, y: {z: [false, null, ""]}} 反序列化
```

# 对象方法

除非手动创建为没有原型，否则所有对象都从`Object.prototype`继承属性。因此也会继承一些方法：

```javascript
let o1 = { x: 1 }
let o2 = {
  x: 1,
  y: 2,
  toString: function() {
    return `(x: ${this.x}, y: ${this.y})`
  },
  toLocaleString: function() {
    return `(x: ${this.x.toLocaleString()}, y: ${this.y.toLocaleString()})`
  },
  toJSON:function() {
    return "自定义toJSON"
  }
}

// toString
console.log(o1.toString()) // [object Object] 不重写toString,只会打印
console.log(o2.toString()) // x: 1, y: 2

// toLocaleString
console.log(o1.toLocaleString()) // [object Object] 默认会调用toString
console.log(o2.toLocaleString()) // (x: 1, y: 2)
console.log(new Date().toLocaleString()) // 2024/3/14 10:08:48

// valueOf
console.log(o1.valueOf()) // { x: 1 }
console.log(new Date().valueOf()) // 1647270528000

//toJSON
console.log(JSON.stringify(o1)) // {"x":1}
console.log(JSON.stringify(o2)) // "自定义toJSON"
```

# 字面量扩展语法

```javascript
// 简写属性
let x = 1, y = 2
let o1 = { x, y } // 等价于{ x: x, y: y }

// 计算属性名
let o2 = {
  ["name" + 2]: "Nicholas",
  [Symbol("desc")]: "Symbol",
} 

//符号作为属性名
const extension = Symbol("my extension symbol")
let o ={
    [extension]: {x:0},
}
o[extension].y=1


```

