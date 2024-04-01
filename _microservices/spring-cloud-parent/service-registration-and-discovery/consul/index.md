---
layout: note
title: Consul
nav_order: 10
parent: 服务注册与发现
create_time: 2024/3/19
---

# 概述

`HashiCorp Consul`是一种服务网络解决方案，使团队能够在本地和多云环境以及运行时之间管理服务之间的安全网络连接。

Consul提供`服务发现`、`服务网格`、`流量管理`和`对网络基础设施设备的自动更新`。您可以在单个Consul部署中单独或一起使用这些功能。

# Windows下载安装

- 下载压缩包

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202403191343407.png)

- 解压压缩包至指定目录

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202403191344520.png)

- 开发模式启动

```shell
consul agent -dev
```

- 使用浏览器访问`http://localhost:8500`，可以看到Consul的Web界面

# 服务注册


