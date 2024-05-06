---
icon: simple/typescript
---

# TypeScript

## 环境搭建

- 下载、安装Node.js
- 全局安装TypeScript：`npm install -g typescript@next`
- 编写测试ts代码：

``` typescript title="hello_world.ts"
--8<-- "docs/front_end/typescript/hello_world.ts"
```

- 编译ts代码：`tsc hello_world.ts`，得到js文件`hello_world.js`

!!! 编译细节

    - 默认情况下，即使编译出错，仍然会生成js文件。
    - 声明的let变量会编译成var，以确保兼容任意版本的JavaScript标准。

## 类型注解

``` typescript title="类型注解语法"
--8<-- "docs/front_end/typescript/variable_type.ts"
```


