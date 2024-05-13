# 对象

## 概述

`对象`是一个`属性`的`无序集合`。

## 创建对象

### 对象字面量创建对象

```javascript
let empty = {}; 

let point = {
    x: 10,
    y: 20
};

// 属性名包含空格或连字符
let book = {
    "main title": "JavaScript",
    "sub-title":"The Definitive Guide"
};
```

### new 创建对象

```javascript
let o = new Object();
let a = new Array();
let d = new Date();
```

### Object.create()创建对象⛏️

通过`Object.create()`创建对象，可以指定对象的原型。

```javascript
// Object.create使用第一个参数作为新对象的原型
// 因为参数为字面量，因此继承自Object.prototype
// 因此对象o1也继承Object.prototype
let o1 = Object.create({x: 1, y: 2});

// 创建一个没有原型的对象
// 这意味着该对象不会继承任何方法，连toString这种最基本的方法都没有。
let o2 = Object.create(null);

// 创建一个普通的空对象
// 这个对象等价于 {} 对象
let o3 = Object.create(Object.prototype);
```

??? question "Object.create(null)和{}的区别"

    使用`Object.create(null)`创建的对象是一个纯净的空对象，不继承任何属性或方法，适合用于需要一个干净的对象作为存储数据的容器。

    而使用`{}`创建的对象则是继承自Object.prototype的普通对象，可能会包含一些默认的属性和方法。

```javascript
let o = {x: "不要修改这个值"};
// 这样做可以有效防止对象o在函数中被意外修改
library.function(Object.create(o));
```

## 查询和设置属性

### 查询属性

```javascript
// 使用点.操作符访问属性
let author = book.author;

// 使用方括号[]操作符访问属性
let title = book["main title"];
```

### 创建或设置属性

```javascript
book.edition = 7;

book["main title"] = "JavaScript: The Definitive Guide";
```

## 属性继承

对象的属性可以通过`原型链`实现继承效果。

```javascript
let o = {};
o.x = 1;
// 对象p的原型为对象o
let p = Object.create(o);
p.y = 2;
// 对象q的原型为对象p
let q = Object.create(p);
q.z = 3;

// toString继承自Object.prototype
console.log(q.toString());

// 3;x和y属性继承自o和p
console.log(q.x + q.y); 

// 修改原始对象属性并不会影响原型链中的属性
q.x=5;
console.log(o.x) // 1
```

## 属性访问错误

### 访问属性错误

```javascript title="属性访问错误问题"
let book = {
    title: "JavaScript: The Definitive Guide"
}

// ✅访问不存在的属性并不会报错
let subtitle = book.subtitle; // undefined

// ❌ 查询不存在属性的属性会报错
let len = book.subtitle.length; //❌报错
```

```javascript title="解决方案"
let len = undefined;

// 方式一
if (book) {
    if (book.subtitle) {
        len = book.subtitle.length;
    }
}

// 方式二
let len = book && book.subtitle && book.subtitle.length;

//方式三：条件式属性访问
let len = book?.subtitle?.length;
```

### 设置属性错误

同上，尝试在null或undefined对象上设置属性会报错。

其它情况，在对象o上设置属性p会失败：

- o有一个只读自有属性p:不可能设置`只读属性`。
- o有一个只读继承属性p:不可能用`同名自有属性`隐藏`只读继承属性`。
- 
