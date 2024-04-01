---
layout: note
title: 包管理工具
nav_order: 200
parent: JavaScript
create_time: 2024/1/26
---

# npm介绍

`npm`（全称 Node Package Manager，即`node包管理器`）是Node.js默认的、用JavaScript编写的软件包管理系统。

node内置，无需安装。

# cnpm介绍

`cnpm`（全称 China Node Package Manager，即`中国node包管理器`）是淘宝团队为解决`npm`安装慢的问题，推出的`npm镜像`。你可以用此代替官方版本(❗只读)。

[官网](https://npmmirror.com/)

```shell
# 全局安装cnpm工具包
npm install -g cnpm --registry=https://registry.npmmirror.com
```

# yarn

`yarn`是Facebook推出的新一代包管理工具，用于替代`npm`。


```shell
# 全局安装yarn
npm i -g yarn
```

# package.json

`package.json`是包配置文件，用于配置项目的依赖包、脚本等信息。

- `name`：包名称，不能使用中文或大写。一般与项目文件夹名称一致。
- `version`：包版本，格式为`x.x.x`，其中`x`为数字。
- `description`：包描述
- `keywords`：关键字
- `main`：入口文件
- `scripts`：用于配置项目的脚本命令。
- `license`：许可证

# 配置镜像

```shell
# 查看当前源
npm config get registry
yarn config list

# 直接配置，缺点是每次都要输入
npm config set registry https://registry.npmmirror.com
yarn config set registry https://registry.npmmirror.com
```

使用nrm（npm registry manager）进行配置：

```shell
# 安装nrm
npm i -g nrm

# 查看源
nrm ls

# 切换源
nrm use 源名称
```

# 包初始化

```shell
# 使用npm
npm init

# 指定项目名称
npm init my-react-app

# 在当前文件夹下创建项目
npm init .

# 使用yarn
yarn init
```

也可以手动创建编写`package.json`来初始化项目,npm init的作用其实就是创建`package.json`文件。

# 搜索包

```shell
npm s 关键字
```

也可以在网址中进行搜索`https://www.npmjs.com/`

# 安装包

```shell
# 安装包
npm install 包名

# 简写
npm i 包名

# 安装指定版本
npm i 包名@版本号
yarn add 包名@版本号

# 安装生产环境依赖
npm i 包名 --save
npm i 包名 -S
yarn add 包名

# 安装开发环境依赖
npm i 包名 --save-dev
npm i 包名 -D
yarn add 包名 --dev

# 安装项目所需的全部依赖
npm i
yarn
```

{: .note-title}
> npm包通过包名导入模块的流程
>
> 1. 从当前目录的`node_modules`文件夹中查找包名对应的文件夹。
> 2. 如果没有找到，则从上一级目录的`node_modules`文件夹中查找。直到磁盘根目录。
> 3. 读取文件夹中package.json中的main属性指定的入口文件。
> 4. 从入口文件中导出模块。

# 升级包

```shell
# 升级包到最新版本
npm update 包名@laster
yarn upgrade 包名@laster
```

# 全局包

```shell
# 全局安装
npm i 包名 --global
npm i 包名 -g
yarn global add 包名

# 查看全局安装目录
npm root -g
yarn global bin
```

{: .note-title}
> 修改Windows执行策略，解决PowerShell无法运行全局npm包的问题
> 
> 1. 以管理员身份打开`powershell`
> 2. 输入命令`set-Executionpolicy remotesigned`,选择`[A] 全是(A)`

# 删除包

```shell
# 删除包
npm remove 包名
npm r 包名
yarn remove 包名

# 删除全局包
npm r 包名 -g
yarn global remove 包名
```

# 发布包

package.json中相关参数：

```json
{
    "name": "包名",
    "version": "版本号",
    "description": "包描述",
    "main": "入口文件",
    "keywords": [
        "关键字"
    ],
    "author": "作者",
    "license": "许可证"
}
```

```shell
# 将npm的地址设置为官方的地址
nrm use npm

# 登录npm
npm login

# 发布包
npm publish

# 删除包
npm unpublish 包名 --force
```
