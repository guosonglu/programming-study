# 面向对象

## 对象

### 什么是对象

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
组成。对象在`字段`（某些编程语言中的变量）中存储其状态，并通过`方法`（某些编程语言中的函数）展示其行为。`方法`对对象的`内部状态`
进行操作，并作为对象间通信的主要机制。`隐藏内部状态`并要求所有交互通过对象的`方法`进行，这被称为数据`封装`——面向对象编程的基本原则。

以自行车为例：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412062139053.png){ loading=lazy }
  <figcaption>作为软件对象建模的自行车。</figcaption>
</figure>

通过设置状态（当前速度、当前踏频和当前档位）并提供改变状态的方法，该对象能够控制外界如何使用它。例如，如果自行车只有6个档位，那么改变档位的方法可以拒绝任何小于1或大于6的值。

将代码打包成单独的软件对象带来了许多好处，包括：

1. `模块化`：一个对象的源代码可以独立于其他对象的源代码编写和维护。一旦创建，一个对象可以在系统内部轻松传递。
2. `信息隐藏`：通过仅与对象的方法交互，其内部实现的细节对外界保持隐藏。
3. `代码重用`：如果一个对象已经存在（可能由其他软件开发人员编写），你可以在你的程序中使用该对象。这使得专家可以实现、测试和调试复杂的、特定任务的对象，然后你可以放心地在自己的代码中运行它们。
4. `可插拔性和调试便利性`：如果某个特定对象出现问题，你可以简单地将其从应用程序中移除，并插入一个不同的对象作为替换。这类似于在现实世界中修复机械问题。如果一个螺栓断了，你只需更换它，而不是整个机器。

## 类

### 什么是类

在现实世界中，你经常会发现许多相同类型的个体对象。可能有成千上万辆相同品牌和型号的自行车存在。每辆自行车都是根据同一套蓝图制造的，因此包含相同的组件。在面向对象的术语中，我们说你的自行车是被称为自行车的对象类的一个实例。
`类是创建个体对象的蓝图`。

以下是自行车类的一种可能实现：

``` java
class Bicycle {

	int cadence = 0;
	int speed = 0;
	int gear = 1;

	void changeCadence(int newValue) {
		cadence = newValue;
	}

	void changeGear(int newValue) {
		gear = newValue;
	}

	void speedUp(int increment) {
		speed = speed + increment;
	}

	void applyBrakes(int decrement) {
		speed = speed - decrement;
	}

	void printStates() {
		System.out.println("cadence:" +
				cadence + " speed:" +
				speed + " gear:" + gear);
	}
}
```

Java 编程语言的语法可能对你来说比较新颖，但这个类的设计基于之前关于自行车对象的讨论。`字段` cadence、speed 和 gear 代表对象的
`状态`，而`方法`（如 changeCadence、changeGear、speedUp 等）定义了它与外界的`交互`。

您可能已经注意到，Bicycle 类中没有包含 `main 方法`。这是因为它不是一个完整的应用程序；它只是一个用于应用程序中的自行车的蓝图。创建和使用新的
Bicycle 对象的职责属于您应用程序中的其他类。

这是一个BicycleDemo类，用于创建两个独立的Bicycle对象并调用它们的方法：

``` java
class BicycleDemo {
	public static void main(String[] args) {

		// 创建两个不同的自行车对象
		Bicycle bike1 = new Bicycle();
		Bicycle bike2 = new Bicycle();

		// 对这些对象调用方法。
		bike1.changeCadence(50);
		bike1.speedUp(10);
		bike1.changeGear(2);
		bike1.printStates();

		bike2.changeCadence(50);
		bike2.speedUp(10);
		bike2.changeGear(2);
		bike2.changeCadence(40);
		bike2.speedUp(10);
		bike2.changeGear(3);
		bike2.printStates();
	}
}
```

此测试的输出将打印两辆自行车的终点踏频、速度和档位：

```shell
cadence:50 speed:10 gear:2
cadence:40 speed:20 gear:3
```

### 什么是继承(Inheritance)

不同种类的物体通常彼此之间有一些共同点。例如，山地自行车、公路自行车和双人自行车都具有自行车的特征（当前速度、当前踏频、当前齿轮）。然而，每种自行车也有其独特的特征：双人自行车有两个座位和两套车把；公路自行车有下弯车把；一些山地自行车有额外的链轮，从而提供更低的齿轮比。

面向对象编程`允许类从其他类继承常用的状态和行为`。在这个例子中，Bicycle 现在成为 MountainBike、RoadBike 和 TandemBike 的超类。在
Java 编程语言中，每个类允许有一个直接超类，并且每个超类可以拥有无限数量的子类：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412070938124.png){ loading=lazy }
  <figcaption>自行车类别的层级。</figcaption>
</figure>

创建子类的语法很简单。在类声明的开头，使用 `extends 关键字`，后接要继承的类名：

``` java
class MountainBike extends Bicycle {

	// 定义山地自行车的新字段和方法将在此处添加

}
```

这使得MountainBike拥有与Bicycle相同的字段和方法，同时可以专注于其独特的功能。这使得子类的代码易于阅读。然而，你必须注意正确记录每个超类定义的状态和行为，因为这些代码不会出现在每个子类的源文件中。

## 接口

### 什么是接口

正如你已经了解到的，对象通过它们公开的方法来定义与外界的交互。方法构成了对象与外界的接口；例如，电视机前面的按钮就是你与其塑料外壳另一侧的电线之间的接口。你按下
`电源`按钮来打开和关闭电视。

在最常见的形式中，接口是一组相关的方法，这些方法没有具体实现。如果将自行车的行为定义为接口，可能会如下所示：

``` java
interface Bicycle {

	//  wheel revolutions per minute
	void changeCadence(int newValue);

	void changeGear(int newValue);

	void speedUp(int increment);

	void applyBrakes(int decrement);
}
```

要实现这个接口，您的类名需要更改（例如，改为某个特定品牌的自行车，如ACMEBicycle），并在类声明中使用`implements关键字`：

``` java
class ACMEBicycle implements Bicycle {

	int cadence = 0;
	int speed = 0;
	int gear = 1;

	// 编译器现在将要求实现方法 
	// changeCadence、changeGear、speedUp 和 applyBrakes。
	// 如果这个类中缺少这些方法，编译将失败。

	void changeCadence(int newValue) {
		cadence = newValue;
	}

	void changeGear(int newValue) {
		gear = newValue;
	}

	void speedUp(int increment) {
		speed = speed + increment;
	}

	void applyBrakes(int decrement) {
		speed = speed - decrement;
	}

	void printStates() {
		System.out.println("cadence:" +
				cadence + " speed:" +
				speed + " gear:" + gear);
	}
}
```

实现接口使类对其承诺提供的行口在类与外部世界之间形成了一种契约，这种契约在构建时由编译器强制执行。如果一个类声称实现了某个接口，那么该接口定义的所有方法都必须出现在类的源代码中，否则类将无法成功编译。

!!! note

	要实际编译ACMEBicycle类，您需要在实现的接口方法开头添加`public关键字`。关于这样做的原因，您将在后续的类与对象、接口与继承课程中学习到。

## 包(Package)

### 什么是包

包是一个`命名空间`，用于组织一组相关的类和接口。从概念上讲，你可以将包视为类似于计算机上的不同文件夹。你可能会将HTML页面放在一个文件夹中，图像放在另一个文件夹中，脚本或应用程序放在另一个文件夹中。由于用Java编程语言编写的软件可能由数百或数千个独立的类组成，因此通过将相关的类和接口放入包中来保持组织性是合理的。

Java 平台提供了一个庞大的类库（即一组包），适用于您自己的应用程序。这个类库被称为“应用程序编程接口”，简称“API”。这些包代表了与通用编程最常相关的任务。例如，String 对象包含字符字符串的状态和行为；File 对象使程序员能够轻松地在文件系统上创建、删除、检查、比较或修改文件；Socket 对象允许创建和使用网络套接字；各种 GUI 对象控制按钮和复选框以及其他与图形用户界面相关的元素。实际上有成千上万的类可供选择。这使得程序员可以专注于特定应用程序的设计，而不是其运行所需的基础设施。

Java平台API规范包含Java SE平台提供的所有包、接口、类、字段和方法的完整列表。在浏览器中加载该页面并将其加入书签。作为程序员，这将成为您最重要的参考文档。

## 对象之间关系及UML表示

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

``` java
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
