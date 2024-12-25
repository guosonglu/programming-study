# 基础知识

[参考文档](https://docs.docker.com/manuals/)

## 安装Docker

### Centos安装配置

- 先卸载之前残留的docker包

```shell
sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
```

- 安装 `yum-utils` 软件包（提供 `yum-config-manager` 工具），并设置仓库。

```shell
sudo yum install -y yum-utils

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

- 安装docker

```shell
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

- 启动docker

```shell

sudo systemctl start docker

# 设置docker开机启动
sudo systemctl enable docker
```

### Windows安装

1. 下载[Docker Desktop](https://docs.docker.com/desktop/install/windows-install/)安装包
2. 双击 Docker Desktop Installer.exe 运行安装程序。默认情况下，Docker Desktop 安装在 C:\Program Files\Docker\Docker。
3. 根据您的后端选择，在配置页面上提示时，确保选择或不选择`使用 WSL 2 而非 Hyper-V`选项。如果您的系统仅支持这两个选项之一，您将无法选择使用哪个后端。
4. 请按照安装向导中的说明授权安装程序并继续安装。
5. 安装成功后，选择“关闭”以完成安装过程。

## Docker基本操作

### 镜像加速

!!! danger

	国内docker加速镜像源目前都已陆续关闭。

阿里云docker镜像加速：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410072220646.png){ loading=lazy }
  <figcaption>阿里云容器镜像加速</figcaption>
</figure>

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410072222528.png){ loading=lazy }
  <figcaption>对应Centos的加速方法</figcaption>
</figure>

### 查看Docker基本信息

查看Docker基本信息，比如镜像源。

```shell
docker info
```

## 镜像基本操作

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410101613061.png){ loading=lazy }
  <figcaption>docker镜像常用操作</figcaption>
</figure>

### images-查看所有本地镜像

```shell
docker images
```

### pull-远程拉取镜像

```shell
# 拉取最新镜像
docker pull mysql

# 拉取指定版本镜像
docker pull mysql:5.7
```

### rmi-删除本地镜像

```shell
# 删除本地镜像
docker rmi mysql
```

### load-加载镜像文件

```shell
# 加载镜像文件
docker load -i mysql.tar
```

### save-保存本地镜像为文件

```shell
# 保存本地镜像为文件
docker save -o mysql.tar mysql
```

## 容器基本操作

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410101614103.png){ loading=lazy }
  <figcaption>docker容器常见操作</figcaption>
</figure>

### ps-查看所有容器

```shell
# 查看正在运行的容器
docker ps

# 查看所有容器(包括已经停止的)
docker ps -a
```

### run-创建并启动容器

```shell
# 创建并启动容器
# -d: 后台运行
# -p: 端口映射
# --name: 容器名
docker run -d -p 3306:3306 --name mysql mysql:5.7
```

!!! note

	即使镜像不存在，执行`docker run`会自动先去下载镜像

### stop-停止容器

```shell
# 停止容器
docker stop mysql
```

### start-启动已有容器

```shell
# 启动已有容器
docker start mysql
```

### logs-观察容器日志

```shell
# 观察容器日志
docker logs mysql

# 查看实时日志
docker logs -f mysql
```

### inspect-查看容器详情

```shell
# 查看容器详情，比如挂载的数据卷
docker inspect nginx
```

### exec-进入容器内部

```shell
# 进入容器内部
# -i：interactive，保持标准输入打开，即使未连接
# -t: tty,分配一个伪终端
# bash: 指定shell种类
docker exec -it mysql bash
```

### rm-删除容器

```shell
# 删除容器
docker rm mysql

# 强制删除容器（即使容器没有停止）
docker rm -f mysql
```

## 目录挂载

`数据卷(volume)`是一个虚拟目录，是`容器内目录`与`宿主机目录`之间映射的桥梁

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410102145160.png){ loading=lazy }
  <figcaption>数据卷</figcaption>
</figure>

### 数据卷挂载

挂载行为必须在创建容器时进行。

!!! note

	创建容器时如果不显示挂载数据卷，容器会自动挂载匿名卷

```shell
# 挂载数据卷
docker run -d \
--name nginx \
-p 80:80 \
-v html:/usr/share/nginx/html \
nginx
```

### 本地目录挂载

直接挂载到`数据卷`，数据卷的位置不是很好记，维护不方便。

我们可以直接将容器中的目录挂载到`本地目录`。

```shell
# 挂载本地目录
docker run -d \
--name nginx \
-p 80:80 \
-v /usr/share/nginx/html:/usr/share/nginx/html \
nginx
```

!!! 本地挂载和数据卷挂载区别

	-v 本地目录:容器内目录

	本地目录必须以`/`或者`./`开头。如果直接以名称开头会被认为是`数据卷`。

### 查看所有数据卷

```shell
# 查看数据卷
docker volume ls
```

### 查看数据卷详情

```shell
# 查看数据卷详情
docker volume inspect html
```

### 删除指定数据卷

```shell
# 删除指定数据卷
docker volume rm html
```

### 清理未使用的数据卷

```shell
# 清理未使用的数据卷
docker volume prune
```

## 容器网络

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410121555543.png){ loading=lazy }
  <figcaption>容器之间处于同一个默认网段之间</figcaption>
</figure>

虽然容器之间可以相互访问，但是每次启动容器时分配的ip是会变化的，因此不建议容器之间通过默认网段访问。

### 查看所有网络

```shell
# 查看容器网络
docker network ls
```

### 创建网络

```shell
# 创建容器网络
docker network create 网络名
```

### 链接容器到指定网络

```shell
# 链接容器到指定网络
docker network connect 网络名 容器名
```

也可以在创建容器时指定网络：

```shell
# 创建容器时指定网络
docker run -d \
--name nginx \
-p 80:80 \
--network 网络名 \
nginx
```

!!! note

	默认网络名为`bridge`，容器之间需要通过ip地址访问，ip地址可能会发生变化。

	通过自定义网络，容器间可以通过`容器名称`进行访问。


