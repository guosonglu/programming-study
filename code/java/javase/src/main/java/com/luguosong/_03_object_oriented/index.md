# 面向对象

## 什么是对象

要理解面向对象技术，关键在于对象。环顾四周，你会发现许多现实世界中的对象：你的狗、你的书桌、你的电视机、你的自行车。

现实世界的对象具有两个特征：它们都有`状态`和`行为`。

- 狗有`状态`（名字、颜色、品种、饥饿）和`行为`（吠叫、取物、摇尾巴）。
- 自行车也有`状态`（当前档位、当前踏频、当前速度）和`行为`（换档、改变踏频、刹车）。

识别现实世界对象的`状态`和`行为`是开始面向对象编程思维的一个好方法。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409060858570.png){ loading=lazy }
  <figcaption>软件对象</figcaption>
</figure>

软件对象在概念上类似于现实世界的对象：它们也由`状态`和相关`行为`
组成。对象在字段（某些编程语言中的变量）中存储其状态，并通过方法（某些编程语言中的函数）展示其行为。方法对对象的内部状态进行操作，并作为对象间通信的主要机制。隐藏内部状态并要求所有交互通过对象的方法进行，这被称为数据封装——面向对象编程的基本原则。

## 对象之间关系UML表示

### 依赖

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409270853756.png){ loading=lazy }
  <figcaption>UML 图中的依赖。教授依赖于课程资料。</figcaption>
</figure>

依赖是类之间关系中最基本且最弱的一种类型。

如果一个类的定义发生变化可能导致另一个类需要修改，那么这两个类之间就存在`依赖关系`。

依赖通常发生在代码中使用具体类名时。比如：

- 方法形参中的类名
- 返回值中的类名

通过让代码依赖于`接口`或`抽象类`而不是具体类，可以使依赖关系更弱。

!!! note

	通常情况下，UML图不会展示所有依赖——它们在真实代码中的数量太多了。为了不让依赖关系破坏UML图，你必须对其进行精心选择，仅展示那些对于沟通你的想法来说重要的依赖关系。

### 关联

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409270855555.png){ loading=lazy }
  <figcaption>UML 图中的关联。教授与学生进行交流。</figcaption>
</figure>

`关联`是一个对象使用另一对象或与另一对象进行交互的关系。

`关联`可视为一种特殊类型的`依赖`，即一个对象总是拥有访问与其交互的对象的权限，而简单的依赖关系并不会在对象间建立永久性的联系。

举例说明：

- 字段
- getter方法

!!! note

	双向关联也是完全正常的，这种情况就用双向箭头来表示。

```java
public class Professor {
	/*
	 * 学生（Student）类是教授类的依赖,如果remember（记住）方法被修改，教授的代码也将崩溃。
	 * 由于教授的所有方法总能访问student成员变量，所以学生类就不仅是依赖，而也是关联
	 * */
	private Student student;


	/*
	 * 接收一个来自课程（Course）类的参数。
	 * 如果有人修改了课程类的getKnowledge（获取知识）方法（修改方法名或添加一些必须的参数等），
	 * 代码将会崩溃。这就是依赖关系。
	 * */
	void teach(Course c) {
		this.student.remember(c.getKnowledge());
	}
}
```

### 聚合

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409271014763.png){ loading=lazy }
  <figcaption>UML 图中的聚合。院系包含教授。</figcaption>
</figure>

`聚合`是一种特殊类型的`关联`，用于表示多个对象之间的`一对多`、`多对多`或`整体对部分`的关系。

通常在聚合关系中，一个对象`拥有`一组其他对象，并扮演着容器或集合的角色。

`组件可以独立于容器存在`，也可以同时连接多个容器。

### 组合

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409271452730.png){ loading=lazy }
  <figcaption>UML 图中的组合。大学由院系构成。</figcaption>
</figure>

`组合`是一种特殊类型的`聚合`，其中一个对象由一个或多个其他对象实例`构成`。

!!! warning

	注意，许多人常常在实际想说聚合和组合时使用`组合`这个术语。 其中最恶名昭彰的例子是著名的`组合优于继承`原则。这并不是因为人们不清楚它们之间的差别，而是因为`组合（例如‘对象组合’）`说起来更顺口。

### 小结

- `依赖`：对类B进行修改会影响到类A。
- `关联`：对象A知道对象B。类A依赖于类B。
- `聚合`：对象A知道对象B且由B构成。类A依赖于类B。
- `组合`：对象A知道对象B、由B构成而且管理着B的生命周期。类A依赖于类B。
- `实现`：类A定义的方法由接口B声明。对象A可被视为对象B。类A依赖于类B。
- `继承`：类A继承类B的接口和实现，但是可以对其进行扩展。对象A可被视为对象B。类A依赖于类B。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202409271516685.png){ loading=lazy }
  <figcaption>对象和类之间的关系：从弱到强。</figcaption>
</figure>
