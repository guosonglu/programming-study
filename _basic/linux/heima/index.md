---
layout: note
title: 黑马Linux笔记
nav_order: 1
parent: linux
create_time: 2023/6/29
---

# 图形界面和命令行界面

```shell
# 设置默认命令行界面启动
systemctl set-default multi-user.target

# 设置默认图形界面启动
systemctl set-default graphical.target
```

- `切换命令行界面`:Ctrl + Alt + F2

# 文件和目录操作

## 目录创建-mkdir

```shell
# mkdir [选项] 目录名
# -p,--parents 递归创建目录
# -v,--verbose 显示创建过程
# -m,--mode=模式值 设置权限

# 递归创建目录
mkdir -p /tmp/a/b/c 
```

## 目录删除-rmdir

```shell
# rmdir [选项] 目录名
# -p,--parents 递归删除空目录
# -v,--verbose 显示删除过程

# 💀注意：删除的目录必须是空目录

# 递归删除空目录
rmdir -p /tmp/a/b/c 

# 删除非空目录，其中r表示递归删除，f表示强制删除
rm -rf /tmp/a/b/c 
```

## 文件创建-touch

```shell
# touch [选项] 文件名
# {开始..结束} 创建多个文件

# 创建文件
touch /tmp/a.txt

# 创建多个文件
touch /tmp/{a.txt,b.txt,c.txt}
touch /tmp/{a..c}.txt
```

## 文件删除-rm

```shell
# rm [选项] 文件名
# -f,--force 忽略不存在的文件，不提示用户
# -r,--recursive 递归删除目录下的文件

# 删除文件
rm /tmp/a.txt

# 递归删除
rm -r /tmp/a

# 强制删除
rm -f /tmp/a
```

## 复制-cp

```shell
# cp [选项] 源文件或目录 目标文件或目录
# -r,--recursive 递归复制目录

# 复制文件
cp /tmp/a.txt /tmp/

# 复制文件，并重命名
cp /tmp/a.txt /tmp/b.txt

# 复制文件夹
cp -r /tmp/a /tmp/
```

## 剪切、重命名-mv

```shell
# mv [选项] 源文件或目录 目标文件或目录

# 剪切文件
mv /tmp/a.txt /tmp/

# 剪切文件夹
mv /tmp/a /tmp/

# 文件重命名(将a.txt重命名为b.txt)
mv /tmp/a.txt /tmp/b.txt
```

# 文件打包压缩

## 打包-tar

```shell
# tar [选项] 目标文件 被打包文件名
# -c,--create 创建打包文件
# -v,--verbose 显示打包过程
# -f,--file=打包文件 指定打包文件
# -u,--update 更新打包文件
# -t,--list 列出打包文件中包含的文件
# -x,--extract 解包打包文件

# 打包多个文件（将a.txt和b.txt打包成test.tar）
tar -cvf /tmp/test.tar /tmp/a.txt /tmp/b.txt

# 更新打包文件（将c.txt添加到test.tar中）
tar -uvf /tmp/test.tar /tmp/c.txt 

# 查看打包文件中包含的文件
tar -tf /tmp/test.tar

# 释放打包文件
tar -xvf /tmp/test.tar
```

## gzip压缩

```shell
# 压缩文件
tar -zcvf /tmp/test.tar.gz /tmp/a.txt /tmp/b.txt

# 解压文件
tar -zxvf /tmp/test.tar.gz

# 解压文件到指定目录
tar -zxvf /tmp/test.tar.gz -C /tmp/
```

## bz2压缩

```shell
# 压缩文件
tar -jcvf /tmp/test.tar.bz2 /tmp/a.txt /tmp/b.txt

# 解压文件
tar -jxvf /tmp/test.tar.bz2

# 解压文件到指定目录
tar -jxvf /tmp/test.tar.bz2 -C /tmp/
```

## xz压缩

```shell
# 压缩文件
tar -Jcvf /tmp/test.tar.xz /tmp/a.txt /tmp/b.txt

# 解压文件
tar -Jxvf /tmp/test.tar.xz

# 解压文件到指定目录
tar -Jxvf /tmp/test.tar.xz -C /tmp/
```

## zip压缩

```shell
# 压缩文件
zip /tmp/test.zip /tmp/a.txt /tmp/b.txt

# 压缩文件夹
zip -r /tmp/test.zip /tmp/a

# 解压文件
unzip /tmp/test.zip

# 解压文件到指定路径
unzip /tmp/test.zip -d /tmp/
```

# 文件查看

## 正序查看文件内容-cat

```shell
# cat [选项] 文件名
# -n,--number 显示行号

# 查看文件内容
cat /tmp/a.txt
```

## 倒序查看文件内容-tac

```shell
# tac [选项] 文件名
# -n,--number 显示行号

# 查看文件内容
tac /tmp/a.txt
```

## 查看文件前几行-head

```shell
# head [选项] 文件名
# -n,--number 显示行数

# 查看文件前10行
head /tmp/a.txt

# 查看文件前5行
head -n 5 /tmp/a.txt
```

## 查看文件后几行-tail

```shell
# tail [选项] 文件名
# -n,--number 显示行数
# -f,--follow 循环读取

# 查看文件后10行
tail /tmp/a.txt

# 查看文件后5行
tail -n 5 /tmp/a.txt

# 动态查看文件内容，比如查看日志输出
tail -f /tmp/a.txt
```

## 分页查看文件内容-more

more命令查看文件时，打开文件时就已经加载到内存中，所以查看文件时，不会出现卡顿的情况。

退出查看后，文件内容仍然会存在于终端上

```shell
# more [选项] 文件名
# -数字 行数 指定每屏显示的行数

# 分页查看文件内容
more /tmp/a.txt
```

- 交互快捷键
    - `d`: 向下翻动半屏
    - `space`: 向下翻动一屏
    - `b`: 向上翻动半屏
    - `enter`: 向下翻动一行
    - `q`: 退出

## 分页查看文件内容-less

less is more，less时more的增强版

less命令查看文件时，打开文件时不会加载到内存中，所以查看文件时，会出现卡顿的情况。

不会在shell中留下查看的内容

```shell
# less [选项] 文件名
# -n,--lines=行数 指定每屏显示的行数

# 分页查看文件内容
less /tmp/a.txt
```

# 文件统计

## 统计文件内容-wc

word count

```shell
# wc [选项] 文件名
# -l,--lines 统计行数
# -w,--words 统计单词数
# -c,--bytes 统计字节数

# 统计文件行数
wc -l /tmp/a.txt

# 统计文件单词数
wc -w /tmp/a.txt

# 统计文件字节数
wc -c /tmp/a.txt
```

## 统计文件大小-du

disk usage

```shell
# du [选项] 文件名
# -h,--human-readable 以人类可读的方式显示
# -s,--summarize 只显示总计

# 统计文件大小
du -h /tmp/a.txt

# 统计文件夹大小
du -h /tmp/a

# 统计文件夹大小，只显示总计,不显示当中详细文件的大小
du -sh /tmp/a
```

# 文件搜索

## 搜索文件-find

```shell
# find [搜索范围] [选项] [搜索条件]
# -name 按照文件名搜索
# -iname 按照文件名搜索，忽略大小写
# -type 按照文件类型搜索,f:普通文件,d:目录,l:软链接

# 在当前目录下搜索文件名为a.txt的文件
find . -name a.txt

# 在当前目录下搜索文件名为a.txt的文件，忽略大小写
find . -iname a.txt

# 在当前目录下搜索文件名为a.txt的文件，忽略大小写，只搜索普通文件
find . -iname a.txt -type f

# 模糊搜索
find . -iname "a*"
```

## 搜索文件内容-grep

```shell
# grep [选项] 搜索内容 文件名
# -n,--line-number 显示行号

# 在当前目录下搜索文件内容为hello的文件
grep hello /tmp/a.txt
```

# 输出重定向

```shell
# > 覆盖,会覆盖原有内容
echo "hello" > /tmp/a.txt

# >> 追加，在原始内容末尾追加
echo "world" >> /tmp/a.txt
```

# 用户和用户组

## 概述

`用户`可以有一个`主组`和多个`附属组`，用户创建时，会自动创建一个和用户名相同的`主组`。

## 查询用户组

用户组会保存到`/etc/group`文件中，每一行代表一个用户组，每一行的格式如下:

`用户组名`:`密码占位符`:`用户组id`:`用户列表（作为附属组的用户）`

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307031637766-Linux%E7%94%A8%E6%88%B7%E7%BB%84%E4%BF%A1%E6%81%AF%E6%96%87%E4%BB%B6.png)

## 添加用户组-groupadd

```shell
# groupadd 用户组名
# -g,--gid 指定用户组id,如果不指定，默认从1000开始

# 添加用户组，并指定编号
groupadd -g 1000 test
```

## 修改用户组名-groupmod

```shell
# groupmod [选项] 用户组名
# -n,--new-name 新的用户组名
# -g,--gid 新的用户组id

# 修改用户组名
groupmod -n test1 test

# 修改用户组id
groupmod -g 1001 test
```

## 删除用户组-groupdel

```shell
# groupdel 用户组名

# 删除用户组
groupdel test
```

## 查询用户信息

Linux中用户信息会保存在`/etc/passwd`文件中，每一行代表一个用户，每一行的格式如下:

`用户名`:`密码占位符`:`用户id`:`用户组id`:`用户描述信息`:`用户家目录`:`用户使用的shell`

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307031636021-Linux%E7%94%A8%E6%88%B7%E4%BF%A1%E6%81%AF%E6%96%87%E4%BB%B6.png)

查询指定用户信息：

```shell
# id 用户名
# 查询结果：
# uid=用户编号
# gid=所属主组的编号
# groups=用户主组以及附属组信息，第一个是主组，后面的是附属组

# 查询用户信息
id testUser
```

## 添加用户-useradd

```shell
# useradd [选项] 用户名
# -g,--gid 指定用户组id
# -G,--groups 指定附属组id
# -s,--shell 指定用户可以使用的shell，默认是 /bin/bash
# -d,--home 指定用户家目录,默认为 /home/用户名
# -u,--uid 指定用户id
# -c,--comment 指定用户描述信息
# -n,--no-create-home 不创建用以用户名为名的用户组

# 添加用户
useradd testUser1

# 创建用户，并指定用户组
useradd -g 1000 testUser2

# 创建用户只能被软件使用，不能用于登录操作系统
useradd -s /sbin/nologin testUser2
```

## 为用户添加密码-passwd

```shell
# passwd 用户名

# 为用户设置密码
passwd testUser1

# 修改当前用户密码
passwd
```

## 用户切换-su

```shell
# su [-] 用户名

# 切换到testUser1用户
su testUser1

# 切换用户的同时切换用户的Home目录
su - testUser1
```

## 修改用户信息-usermod

```shell
# usermod [选项] 用户名
# -g,--gid 指定用户组id
# -l,--login 指定新的用户名
# -s,--shell 修改用户可以使用的shell，默认是 /bin/bash
# -L,--lock 锁定用户，禁止用户登录
# -U,--unlock 解锁用户，允许用户登录

# 修改用户组
usermod -g 1001 testUser1

# 锁定用户
usermod -L testUser1

# 解锁用户
usermod -U testUser1
```

## 删除用户-userdel

```shell
# userdel [选项] 用户名
# -r,--remove 删除用户的同时删除用户的家目录

# 删除用户
userdel testUser1

# 删除用户的同时删除用户的家目录
userdel -r testUser1
```

# 权限管理

## 权限分类

- 读权限(read,r)
  - 文件：读取文件内容
  - 目录：列出目录中的文件列表
- 写权限(write,w)
  - 文件：修改文件内容
  - 目录：在目录中创建、`⭐删除`、重命名文件
- 执行权限(execute,x)
  - 文件：执行文件
  - 目录：进入目录

## 用户分类

- 文件所有者(属主、user、u)
- 文件所属组(属组、group、g)
- 其他用户(o)
- root用户：拥有所有权限，权限设置对于root用户无效

## 权限查看

```shell
# 观察文件权限
ls -l 文件名

# 或者
ll 文件名
```

查询结果说明：

- 第一列：文件的类型+权限
  - 第一个字符：文件类型
    - `-`：普通文件
    - `d`：目录
    - `l`：软链接文件(快捷方式)
    - `b`：块设备文件
    - `c`：字符设备文件
    - `s`：套接字文件
    - `p`：管道文件
  - 第二到第四个字符：文件所有者权限
  - 第五到第七个字符：文件所属组权限
  - 第八到第十个字符：其他用户权限
- 第二列：文件的硬链接数，文件的节点数
- 第三列：文件所属用户
- 第四列：文件所属组
- 第五列：文件大小
- 第六列：文件最后修改时间
- 第七列：文件名

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307051505695-%E6%96%87%E4%BB%B6%E6%9D%83%E9%99%90%E8%A7%82%E5%AF%9F.png)

如下图所示，对于root目录，并没有对其它用户开放任何权限，因此其它用户无法访问`/root`目录。对于root用户也没有开放写权限，但权限设置对于root用户无效，因此root用户依旧可以读写`/root`下的文件:

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307051509052-root%E7%9B%AE%E5%BD%95%E6%9D%83%E9%99%90.png)

## 权限设置

```shell
# chmod [选项] 权限 文件名
# -R,--recursive 递归修改文件权限,针对文件夹

# 给文件所有者增加执行权限
chmod u+x 文件名

# 给文件所属组增加执行权限
chmod g+x 文件名

# 给文件所属组增加执行权限
chmod g=rw 文件名
```

```shell
# 通过数字进行权限设置
# 可读：4
# 可写：2
# 可执行：1

# 给文件所有者增加读写权限
chmod 600 文件名

# 给文件所有者增加读写权限，给文件所属组增加读权限，给其他用户增加读权限
chmod 777 文件名
```

{: .warning}
> 当权限设置为3时，是不合理的。3表示1+3，即可写和可执行权限。但文件没有可读权限，显然是矛盾的。
> 
> 同理，1、2也是不合理的

## 文件拥有者和文件所属组

Linux中，每个用户都有一个`用户名`和`主组`。

当用户创建文件时，文件的拥有者就是创建文件的用户，文件的所属组就是创建文件的用户的主组。

```shell
# 更改文件拥有者
# chown 新的文件拥有者名称 文件名
# -R,--recursive 递归修改文件拥有者,针对文件夹
chown testUser1 test.txt

# 同时更改文件拥有者和文件所属组
chown testUser1:testGroup1 test.txt
```

```shell
# 更改文件所属组
# chgrp 新的文件所属组名称 文件名
# -R,--recursive 递归修改文件所属组,针对文件夹
chgrp testGroup1 test.txt
```

{: .warning-title}
> 当用户名不存在时，会提示错误
> 
> ![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307051810349-%E4%BF%AE%E6%94%B9%E6%96%87%E4%BB%B6%E6%8B%A5%E6%9C%89%E8%80%85%E4%BD%86%E6%8B%A5%E6%9C%89%E8%80%85%E4%B8%8D%E5%AD%98%E5%9C%A8.png)

# 管道-|

管道符`|`可以将一个命令的输出作为另一个命令的输入。


```shell
# 过滤功能

# 查询根目录下包含y的文件
ls / | grep y

# 检索系统中已安装的文件，只筛选mariadb相关信息
rpm -qa | grep mariadb
```

```shell
# 统计功能

# 统计根目录下文件的个数
ls / | wc -l
```

```shell
# xargs命令
# 解决管道符不支持的命令

# 将查询到的文件名作为参数传递给ls命令
# 管道符原本是不支持ls命令的，但是通过xargs命令可以实现
find /etc -name "*.conf" | xargs ls -l
```

# NetworkManager网络管理器

`CentOS7`中默认使用`NetworkManager`网络管理器，`NetworkManager`网络管理器的配置文件存放在`/etc/NetworkManager`目录下。


# network网络管理器

CentOS7中可以使用`network`网络管理器来管理网络，`network`网络管理器的配置文件存放在`/etc/sysconfig/network-scripts`目录下。

## 启动和停止服务

```shell
# 启动服务
systemctl start network

# 停止服务
systemctl stop network

# 查看服务状态
systemctl status network

# 重启服务
systemctl restart network

# 开机启动
systemctl enable network

# 禁止开机启动
systemctl disable network

# 查看服务是否开机启动
systemctl is-enabled network
```

## 获取网络信息-ifconfig

```shell
# ifconfig [网络设备名] [选项]

# 查询所有网络设备信息
ifconfigs
```

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307031839312-Linux%20Ip%E4%BF%A1%E6%81%AF.png)

网卡类型：

- eth0: 有线网卡
- ens33: 有线网卡
- wlan0: 无线网卡
- lo: 本地回环网卡
- virbr0: 虚拟网卡

ip信息说明：

- inet: ip地址
- netmask: 子网掩码
- broadcast: 广播地址

## 网络配置文件

`Red Hat系`网络配置文件存放在`/etc/sysconfig/network-scripts`目录下，文件名格式为`ifcfg-网络设备名`。

![](https://cdn.jsdelivr.net/gh/luguosong/images@master/blog-img/202307031857663-%E7%BD%91%E7%BB%9C%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6.png)

配置文件参数说明：

- TYPE: 网卡类型
- BOOTPROTO: 启动协议，none表示不启动，dhcp表示动态获取ip，static表示静态ip
- NAME: 网卡名称
- DEVICE: 网卡设备名
- ONBOOT: 是否开机启动
- UUID: 网卡唯一标识

# 远程连接

## 远程要素

- 客户端和服务端网路畅通
- 服务器端开启sshd服务

## sshd服务端配置

```shell
# 安装sshd服务
yum install -y openssh-server

# 启动sshd服务
systemctl start sshd

# 开机启动sshd服务
systemctl enable sshd
```

## ssh客户端

- SecureCRT
- Xshell
- Putty
- MobaXterm
