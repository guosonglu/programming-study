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

## Docker部署

### 基本部署

``` shell
docker run -d \
--name nacos \
-e MODE=standalone \
-p 8848:8848 \
nacos/nacos-server
```

### 绑定数据库

```yaml
version: "3.8"
services:
  nacos:
    image: nacos/nacos-server:${NACOS_VERSION}
    container_name: nacos-standalone-mysql
    env_file:
      - ../env/nacos-standlone-mysql.env
    volumes:
      - ./standalone-logs/:/home/nacos/logs
    ports:
      - "8848:8848"
      - "9848:9848"
    depends_on:
      mysql:
        condition: service_healthy
    restart: always
  mysql:
    container_name: mysql
    build:
      context: .
      dockerfile: ./image/mysql/8/Dockerfile
    image: example/mysql:8.0.30
    env_file:
      - ../env/mysql.env
    volumes:
      - ./mysql:/var/lib/mysql
    ports:
      - "3306:3306"
    healthcheck:
      test: [ "CMD", "mysqladmin" ,"ping", "-h", "localhost" ]
      interval: 5s
      timeout: 10s
      retries: 10

```

nacos环境变量配置：

``` env title="nacos-standlone-mysql.env"

PREFER_HOST_MODE=hostname
MODE=standalone
SPRING_DATASOURCE_PLATFORM=mysql
MYSQL_SERVICE_HOST=mysql
MYSQL_SERVICE_DB_NAME=nacos_devtest
MYSQL_SERVICE_PORT=3306
MYSQL_SERVICE_USER=nacos
MYSQL_SERVICE_PASSWORD=nacos
MYSQL_SERVICE_DB_PARAM=characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
NACOS_AUTH_IDENTITY_KEY=2222
NACOS_AUTH_IDENTITY_VALUE=2xxx
NACOS_AUTH_TOKEN=SecretKey012345678901234567890123456789012345678901234567890123456789
```

mysql环境变量配置文件：

``` env title="mysql.env"
MYSQL_ROOT_PASSWORD=root
MYSQL_DATABASE=nacos_devtest
MYSQL_USER=nacos
MYSQL_PASSWORD=nacos
LANG=C.UTF-8
```

## 打包部署Spring Boot

### linux基础镜像

以linux为基础镜像，需要在内部自己构建JDK环境。

### JDK基础镜像




