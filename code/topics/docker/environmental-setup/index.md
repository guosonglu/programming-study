# 生产环境搭建

## Mysql部署

### 基本部署

```shell
# -d: 后台运行
# --name: 容器名
# -p: 端口映射
# -e: 设置环境变量
# /var/lib/mysql:mysql 数据存放目录
# /docker-entrypoint-initdb.d: mysql配置文件目录
# /etc/mysql/conf.d: mysql初始化脚本目录
docker run -d \
	--name mysql \
	-p 3306:3306 \
	-e MYSQL_ROOT_PASSWORD=12345678 \
	-e TZ=Asia/Shanghai \
	-v /root/mysql/data:/var/lib/mysql \
	-v /root/mysql/init:/docker-entrypoint-initdb.d \
	-v /root/mysql/conf:/etc/mysql/conf.d \
	mysql
```

## nginx部署

### 基本部署

```shell
# -d: 后台运行
# --name: 容器名
# -p: 端口映射
# /usr/share/nginx/html: nginx静态文件目录
# /etc/nginx/nginx.conf: nginx配置文件
docker run -d \
	--name nginx \
	-p 80:80 \
	-v /root/nginx/html:/usr/share/nginx/html \
	-v /root/nginx/nginx.conf:/etc/nginx/nginx.conf \
	nginx
```

## 打包部署Spring Boot

### linux基础镜像

以linux为基础镜像，需要在内部自己构建JDK环境。

### JDK基础镜像




