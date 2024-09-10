# 数据库操作语言

## 概述

数据库操作语言（DML,Data Manipulation Language）用于添加、删除、更新和查询数据库记录。

简而言之就是数据的`增删改查`操作。

## 显示表结构

```mysql
describe employees;

# 或者
desc employees;
```

## 查询

### 基本查询

```mysql
# 计算表达式结果
select 1 + 1;

# dual表示伪表
select 1 + 1
from dual;
```

```mysql
# 基本查询
select *
from employees;

# 查询指定列
select employee_id, last_name, salary
from employees;
```

### 列的别名

定义别名可以使用关键字`as`（alias、别名），也可以直接使用`空格`。

如果别名之间带有空格，可以将别名使用引号（`""`）括起来。

```mysql
# 使用别名
select employee_id as id, last_name 姓, salary "personal income"
from employees;
```

### 去除重复行

使用`distinct`关键字去除重复行。

```mysql
select distinct department_id
from employees; 
```

### 处理空值

!!! warning

    空值`null`不等于`0`或者空字符串`''`

```mysql
# commission_pct有可能为null
# 需要对其判断处理后才能正确参与计算
select salary * (1 + ifnull(commission_pct, 0)) * 12 "年工资"
from employees;
```

### 着重号

解决与关键字重名的情况。

```mysql
# order是mysql中的关键字
# 但现在被用作表名，使用着重号标记
select * from `order`;
```

### 条件查询

```mysql
# 条件查询
select *
from employees
where department_id = 90;
```

## 运算符

### 算数运算符

```mysql
# 加减乘除、取模运算
select 10 + 5, 10 / 5, 10 % 5
from dual;

# 数字与字符串相加，并不会进行拼接。而是直接计算
select 10 + "5" from dual; # 15
```

### 比较运算符

比较结果为真返回`1`，结果为假返回`0`。

```mysql
# 比较运算符
# 结果为：1 0
select 1 = 1, "a" = "b"
from dual;


# 数字与字符串比较
# 如果字符串是纯数字，则会隐式转换为数值类型
# 如果字符串内容不是纯数字，则看作0
# 结果为：0 1
select 0 = "1", 0 = "a"
from dual; 
```
