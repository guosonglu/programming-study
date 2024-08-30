# 行为型模式

## 责任链(Chain of Responsibility)🔥

## 迭代器(Iterator)🔥

## 观察者(Observer)🔥

## 模板方法(Template Method)🔥

### 意图

`模板方法`在超类中定义了一个算法的`框架`，允许子类在不修改结构的情况下重写算法的特定步骤。

### 结构

<figure markdown="span">
  ![](https://gcore.jsdelivr.net/gh/luguosong/images@master/blog-img/202405301053573.png){ loading=lazy }
  <figcaption>模板方法结构</figcaption>
</figure>

- `抽象类（AbstractClass）`会声明作为算法步骤的方法，以及依次调用它们的实际模板方法。算法步骤可以被声明为`抽象`类型，也可以提供一些默认实现。
- `具体类（ConcreteClass）`可以重写所有步骤，但不能重写模板方法自身。



## 状态(State)🔥

## 策略(Strategy)🔥

## 命令(Command)

## 访问者(Visitor)

## 备忘录(Memento)

## 中介者(Mediator)

## 解释器(Interpreter)



