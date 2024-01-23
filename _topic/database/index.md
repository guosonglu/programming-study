---
layout: note
title: 数据库-mysql
create_time: 2023/9/7
---

# 🏷️安装与概述

# 常见的数据库管理系统

- 关系型数据库
    - `Oracle`:甲骨文公司的数据库产品。最早的商业数据库产品。
    - `Mysql`:开源的数据库产品。最流行的数据库产品。
    - `Microsoft SQL Server`:微软的数据库产品。
    - `DB2`:IBM的数据库产品,常应用于银行系统中。
    - `PostgreSQL`:开源的数据库产品。最符合SQL标准。
    - `SQLite`:轻量级的数据库产品。常用于移动端(手机端)。
    - `Sybase`:曾经是最流行的数据库产品之一。提供了一个非常专业的数据库建模工具`PowerDesigner`。
    - `infomix`:IBM公司出品，Information和Unix的组合词。第一个被移植到Linux的商业数据库产品。
- 键值型数据库
    - `Redis`:开源的键值型数据库产品。
- 文档型数据库
    - `MongoDB`:开源的文档型数据库产品。可以存储XML、JSON等格式的数据。

# Mysql历史

- 1995年，由瑞典MySQL AB公司开发。
- 2008年，被Sun公司收购。
- 2010年，被Oracle公司收购。MariaDB项目由MySQL的创始人`Michael Widenius`
  发起，目的是完全兼容MySQL，包括API和命令行，使MySQL的使用者能够方便地切换到`MariaDB`，而不需要做任何修改和调整。
- 2015年，`MySQL 5.7`发布。
- Mysql6.x后分为社区版和企业版，社区版免费，企业版收费。
- 2016年，`MySQL 8.0`发布。

# Windows安装Mysql

## 8.x版本安装

- 双击msi文件进行安装

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031323954.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031339249.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031340697.png)

- 选择自定义，修改安装路径

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031346422.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031346061.png)

- 安装完成后进行配置

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031344270.png)

- 选择开发者电脑

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031348848.png)

- 使用默认端口

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031350058.png)

- 设置Root密码

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031352559.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031354832.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031358189.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031359196.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031400123.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031401652.png)

- 配置环境变量

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031421685.png)

## 5.x版本安装

- 双击msi文件进行安装

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031532534.png)

- 选择自定义安装

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031530702.png)

- 选择需要安装的组件

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031534668.png)

- 自定义安装路径和数据存储路径

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031602617.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031603782.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031539267.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031540978.png)

- 如果之前安装过其它mysql，需要修改默认3306端口

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031548201.png)

- 设置root密码

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031550976.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031553043.png)

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031554265.png)

- 配置环境变量（同时安装不同版本的mysql，只能配置一个环境变量）

## 卸载

1. 通过控制面板卸载软件
2. 手动删除数据库数据存放目录
3. 删除环境变量中Path配置的mysql路径
4. 如果是5.x版本，还需要去注册表删除mysql服务

# 初始化配置

## MariaDB设置无密码不能登录

MariaDB 10.4.6版本开始，root用户默认使用`unix_socket`插件认证，不再使用`mysql_native_password`插件认证，所以无法使用密码登录。

```sql
-- 查看插件认证
select * from global_priv \G

ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD("访问密码");

flush privileges;
```

## MariaDB设置远程登录

```sql
-- 为root用户授权远程访问
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '访问密码' WITH GRANT OPTION;
                               
flush privileges;                    
```

找到目录`/etc/mysql/mariadb.conf.d`，编辑`50-server.cnf`文件，将其中的bind-address=127.0.0.1给注释掉（前面加#），如图:

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401031706097.png)

## mysql5.x修改字符集

通过观察发现，mysql 5.x版本默认采用拉丁字符集：

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401051721089.png)

而mysql 8.x则改为了utf8字符集：

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401051722150.png)

在mysql 5.x数据库文件存储路径下找到my.ini文件，修改如下配置：

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401051744323.png)

```ini
[mysql]

default-character-set = utf8

[mysqld]

character-set-server = utf8
collation-server = utf8_general_ci
```

# 默认数据库

```sql
show databases;
```

- `information_schema`：存储了关于数据库的信息，比如数据库名、数据库表名、数据库列名等。
- `mysql`：存储了用户的权限信息。
- `performance_schema`：存储了数据库服务器性能相关的信息。
- `sys`：存储了数据库服务器的系统信息。

# 大小写问题

Windows中不区分大小写。

Linux中`关键字、函数名、列名、列的别名`不区分大小写。`数据库名、表名、表的别名、变量名`区分大小写。

{: .note-title}
> 推荐采用统一的书写规范
>
> - 数据库名、表名、字段名都是用小写。
> - 关键字、函数都是用大写。

# 🏷️DML

DML(Data Manipulation Language)数据操纵语言，用于对数据库中的数据进行`增删改查`
操作。比如：`insert`、`update`、`delete`、`select`等。

# DML-SELECT基础

```sql
-- 后面跟表达式
SELECT 1;
SELECT 9 / 2;
	
-- 基本查询
SELECT * FROM employees;

-- 给列添加别名：AS
SELECT employee_id 员工id, last_name AS 名字, salary AS "员工 工资" FROM employees;

-- 去除重复行:DISTINCT
SELECT DISTINCT department_id FROM employees;

-- 空值参与计算
-- Null值参与计算，结果还是Null
SELECT salary 月工资,commission_pct 奖金比,salary * (1 + commission_pct) * 12 年工资 FROM employees;
-- 正确处理空值
SELECT salary 月工资,commission_pct 奖金比,salary * (1+ IFNULL(0,commission_pct)) * 12 年工资 FROM employees;

-- 着重号
-- order是关键字，当表名与关键字重名时，使用着重号标记。
SELECT * FROM `order`;

-- 显示表结构
DESCRIBE employees;
DESC employees;

-- 数据过滤
SELECT * FROM employees WHERE department_id = 90;
```

# DML-SELECT运算符

```sql
-- 算数运算符
SELECT 100, 100 + 0, 100 + 50, 100 / 2 FROM DUAL;
-- 结果为101，字符串会隐式转换为数值
SELECT 100 + "1" FROM DUAL;
-- 结果为100，无法转换为数值的值会视为0
SELECT 100 + "a" FROM DUAL;
-- 与NULL进行计算：NULL
SELECT 100 + NULL FROM DUAL;

-- 比较运算符：1，1，1
SELECT 1 != 2 ,1 = '1',0 = 'a' FROM DUAL;
-- 与NULL进行比较: NULL,NULL
SELECT 1 = NULL, NULL = NULL FROM DUAL;
-- 安全等于，解决有NULL参与比较的情况:0,1
SELECT 1 <=> NULL, NULL <=> NULL FROM DUAL;
-- 与NULL相关的比较关键字:0,1,0
SELECT 8 IS NULL, 8 IS NOT NULL,ISNULL(8) FROM DUAL;
-- 区间查询（包含边界）
SELECT employee_id,last_name, salary FROM employees WHERE salary BETWEEN 6000 AND 8000;
-- 集合查找
SELECT employee_id,last_name, salary FROM employees WHERE salary IN (6000,8000);
-- 模糊查询,%表示不确定个数的字符,_表示一个字符
SELECT last_name FROM employees WHERE last_name LIKE '%a%';
SELECT last_name FROM employees WHERE last_name LIKE '_a%';
-- 正则表达式
SELECT last_name FROM employees WHERE last_name REGEXP '^a';

-- 逻辑运算符
SELECT employee_id,last_name, salary FROM employees WHERE salary=6000 OR salary=8000;
SELECT employee_id,last_name, salary FROM employees WHERE salary>=6000 AND salary<=8000;
SELECT employee_id,last_name, salary FROM employees WHERE NOT salary>6000;

-- 位运算符（了解就行）
```

# DML-SELECT-排序

```sql
-- 默认升序
SELECT salary FROM employees ORDER BY salary;
-- 升序（ascend）
SELECT salary FROM employees ORDER BY salary ASC;
-- 降序(descend)
SELECT salary FROM employees ORDER BY salary DESC;
```

# DML-SELECT-分页

```sql
-- limit m,n
-- m表示从第几条记录开始(偏移量)，n表示查询几条记录
-- limit (页码-1)*每页显示的记录数,每页显示的记录数
SELECT employee_id,last_name FROM employees LIMIT 2,10;
-- mysql 8.x新特性，OFFSET表示偏移量
SELECT employee_id,last_name FROM employees LIMIT 10 OFFSET 2;
```

# DML-SELECT-多表查询

{: .note-title}
> 为什么需要多表？
> 
> - 解决冗余问题：将数据拆分到不同的表中，避免相同的数据在多张表中重复存储。
> - 节约内存提高查询效率：将数据拆分到不同的表中，可以减少每张表中的数据量，提高查询效率。
> - 更加方便维护

- `内连接`：只查询两张表中满足条件的记录。
- `外连接`：不仅查询两张表中满足条件的记录，还会查询不满足条件的记录。
  - `左外连接`：以左边的表为主，查询左边表中的所有记录，以及右边表中满足条件的记录。
  - `右外连接`：以右边的表为主，查询右边表中的所有记录，以及左边表中满足条件的记录。
  - `全外连接`：查询两张表中的所有记录。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401191439875.png)

```sql
-- 内连接，只查询e.department_id = d.department_id的记录
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name 
FROM employees e,departments d 
WHERE e.department_id = d.department_id;

-- SQL99内连接写法
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e JOIN departments d ON e.department_id = d.department_id;

-- 左外连接
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id;

-- 右外连接
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e RIGHT JOIN departments d ON e.department_id = d.department_id;

-- ❌全外连接,mysql不支持全外连接,oracle支持.
-- SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
-- FROM employees e FULL JOIN departments d ON e.department_id = d.department_id;

-- 使用联合查询实现全外连接
-- 使用UNION ALL而不是UNION，因为UNION会去重，UNION ALL效率更高
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e LEFT JOIN departments d ON e.department_id = d.department_id
UNION ALL 
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e RIGHT JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IS NULL;
```

一些新特性：

```sql
-- 自然连接（SQL99）：自动查找两张表中相同的列，然后以这些列作为条件进行内连接
-- 不够灵活，不推荐使用
SELECT 
e.department_id 员工表中部门id,d.department_id 部门表中部门id,
e.manager_id 员工表中的经理id,d.manager_id 部门表中的经理id,
e.last_name,d.department_name 
FROM employees e NATURAL JOIN departments d;

-- USING子句（SQL99）：指定两张表中相同的列，然后以这些列作为条件进行内连接
SELECT e.department_id 员工表中部门id,d.department_id 部门表中部门id,e.last_name,d.department_name
FROM employees e JOIN departments d USING(department_id);
```

`内联查询`只会查出两张表中满足条件的记录。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401171702225.png)

`左外联`的情况，虽然Grant员工没有匹配到部门，但还是会将员工表中的记录显示出来，只是部门表中的信息显示为NULL。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401171701704.png)

`右外联`的情况，虽然部门表中没有匹配到员工，但还是会将部门表中的记录显示出来，只是员工表中的信息显示为NULL。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202401171704567.png)

# 单行函数

## 数值函数

```sql
-- 绝对值
SELECT ABS(-10),ABS(10) FROM DUAL;

-- 返回符号，正数返回1，负数返回-1，0返回0
SELECT SIGN(-18),SIGN(18),SIGN(0) FROM DUAL;

-- 返回圆周率的值
SELECT PI() FROM DUAL;

-- 返回大于等于指定参数的最小整数
SELECT CEIL(3.14),CEIL(-3.14) FROM DUAL;

-- 返回小于等于指定参数的最大整数
SELECT FLOOR(3.14),FLOOR(-3.14) FROM DUAL;

-- 四舍五入
SELECT ROUND(3.14),ROUND(3.54),ROUND(3.54,1),ROUND(3.54,2) FROM DUAL;

-- 返回指定小数位数的数字(不进行四舍五入)
SELECT TRUNCATE(3.14,1),TRUNCATE(3.59,1),TRUNCATE(123.54,-1) FROM DUAL;

-- 返回列表中最小值
SELECT LEAST(1,2,3,4,5) FROM DUAL;

-- 返回列表中最大值
SELECT GREATEST(1,2,3,4,5) FROM DUAL;

-- 返回余数
SELECT MOD(10,3) FROM DUAL;

-- 返回随机数，种子相同则结果相同
SELECT RAND(),RAND(),RAND(10),RAND(10) FROM DUAL;
```

## 字符串函数

```sql
-- 返回字符的Ascii码
SELECT ASCII('a'),ASCII('A') FROM DUAL;

-- 返回字符串字符数
SELECT CHAR_LENGTH('abc'),CHAR_LENGTH('中文') FROM DUAL;

-- 返回字符串字节数
SELECT LENGTH('abc'),LENGTH('中文') FROM DUAL;

-- 字符串连接
SELECT CONCAT('hello',' ','mysql') FROM DUAL;

-- 使用指定字符连接字符串
SELECT CONCAT_WS('-','hello','mysql','world') FROM DUAL;

-- 插入和替换字符串，mysql中字符串索引从1开始
SELECT INSERT('hello',2,2,'xx') FROM DUAL;

-- 字符串替换
SELECT REPLACE('hello','l','xx') FROM DUAL;

-- 大小写转换
SELECT UPPER('hello'),LOWER('HELLO') FROM DUAL;

-- 左右截取
SELECT LEFT('hello',2),RIGHT('hello',2) FROM DUAL;

-- 左右补位:xxxxxhello,helloxxxxx
SELECT LPAD('hello',10,'x'),RPAD('hello',10,'x') FROM DUAL;

-- 去除空格（中间的空格不会去除）:he llo,he llo , he llo,ohell
SELECT TRIM(' he llo '),LTRIM(' he llo '),RTRIM(' he llo '),TRIM('oo' FROM 'ohelloo') FROM DUAL;

-- 重复打印: hellohellohello
SELECT REPEAT('hello',3) FROM DUAL;

-- 打印指定数量的空格
SELECT SPACE(10) FROM DUAL;

-- 比较字符串大小: -1,1,0
SELECT STRCMP('aa','ab'),STRCMP('b','a'),STRCMP('a','a') FROM DUAL;

-- 获取子字符串: el
SELECT SUBSTR('hello',2,2) FROM DUAL;

-- 子字符串首次出现的位置
SELECT INSTR('hello','l'),LOCATE('l','hello') FROM DUAL;

-- 返回指定位置的字符串
SELECT ELT(2,'a','b','c','d') FROM DUAL;

-- 返回字符串在字符串列表中第一次出现的位置
SELECT FIELD('b','a','b','c','d') FROM DUAL;

-- 返回字符串在列表字符串中的位置
SELECT FIND_IN_SET('b','a,b,c,d') FROM DUAL;

-- 反转字符串
SELECT REVERSE('abc') FROM DUAL;

-- 如果相等返回NULL,如果不等返回第一个不等的字符串
SELECT NULLIF('a','a'),NULLIF('b','a') FROM DUAL;
```

## 日期和时间函数

```sql

```

# 聚合函数


# 🏷️DDL

DDL(Data Definition Language)数据定义语言，用于对数据库中的对象进行`增删改查`操作。比如：`create`、`alter`、`drop`、`truncate`
等。

# 🏷️DCL

DCL(Data Control Language)数据控制语言，用于对数据库中的对象进行`授权`操作。比如：`grant`、`revoke`等。

# 🏷️其它数据库对象

# 🏷️Mysql8新特性

# 🏷️Mysql架构

# 🏷️Mysql索引调优

# 🏷️Mysql事务

# 🏷️Mysql日志和备份





