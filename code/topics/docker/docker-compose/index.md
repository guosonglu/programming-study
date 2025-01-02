# Docker Compose

## 概述

Docker Compose通过`docker-compose.yml`文件来定义一组相关联的应用容器，帮助我们实现`多个互相关联的Docker容器的快速部署`。

Docker Compose 是一种用于定义和运行多容器应用程序的工具。它是实现简化高效的开发和部署体验的关键。

Compose 简化了对整个应用程序栈的控制，使您可以在一个易于理解的 YAML 配置文件中轻松管理服务、网络和卷。然后，只需一个命令，您就可以从配置文件中创建并启动所有服务。

Compose 适用于所有环境：生产、预发布、开发、测试以及 CI 工作流。它还提供了管理应用程序整个生命周期的命令：

- 启动、停止和重建服务
- 查看正在运行服务的状态
- 流式传输运行服务的日志输出
- 在服务上运行一次性命令

## DockerCompose参数与docker run 参数对比

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410122202192.png){ loading=lazy }
  <figcaption>DockerCompose参数与docker run 参数对比</figcaption>
</figure>

## 工作原理

使用 Docker Compose 时，您可以使用一个称为 Compose 文件的 YAML 配置文件来配置应用程序的服务，然后通过 Compose CLI
创建并启动配置中的所有服务。

Compose 文件或 compose.yaml 文件遵循 Compose 规范中提供的规则来定义多容器应用程序。这是 Docker Compose 对正式 Compose
规范的实现。

### Compose文件

默认情况下，Compose 文件的路径是放置在工作目录中的 `compose.yaml`（首选）或 `compose.yml`。为了向后兼容早期版本，Compose 也支持
`docker-compose.yaml` 和 `docker-compose.yml`。如果这两个文件同时存在，Compose 会优先选择标准的 `compose.yaml`。

多个 Compose 文件可以合并在一起以定义应用程序模型。YAML 文件的组合是通过根据您设置的 Compose 文件顺序追加或覆盖 YAML
元素来实现的。简单属性和映射会被最高优先级的 Compose 文件覆盖，列表则通过追加进行合并。当合并的补充文件位于其他文件夹中时，相对路径会基于第一个
Compose 文件的父文件夹进行解析。由于某些 Compose 文件元素可以用单个字符串或复杂对象表示，合并适用于扩展形式。有关更多信息，请参阅使用多个
Compose 文件。

如果你想重用其他的 Compose 文件，或者将应用程序模型的部分内容分离到独立的 Compose 文件中，你也可以使用 `include`。这在你的
Compose 应用程序依赖于由不同团队管理的其他应用程序，或需要与他人共享时非常有用。

### CLI

`Docker CLI` 允许您通过 docker compose 命令及其子命令与 Docker Compose 应用程序进行交互。使用 CLI，您可以管理在
compose.yaml 文件中定义的多容器应用程序的生命周期。CLI 命令使您能够轻松启动、停止和配置您的应用程序。

要启动 compose.yaml 文件中定义的所有服务：

``` yaml
docker compose up
```

停止并移除正在运行的服务：

``` shell
docker compose down  
```

如果您想监控正在运行的容器输出并调试问题，可以通过以下方式查看日志：

``` shell
docker compose logs
```

列出所有服务及其当前状态：

``` shell
docker compose ps
```

### 示例

以下示例说明了上述的Compose概念。该示例为非规范性示例。

请考虑一个分为前端网页应用和后端服务的应用程序。

前端在运行时通过由基础设施管理的HTTP配置文件进行配置，提供外部域名，并由平台的安全密钥存储注入HTTPS服务器证书。

后端将数据存储在持久卷中。

这两个服务在一个独立的后端网络中相互通信，而前端也连接到一个前端网络，并开放443端口供外部使用。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412271628411.png){ loading=lazy }
  <figcaption>示例</figcaption>
</figure>

示例应用程序由以下部分组成：

- 由 Docker 镜像支持的两个服务：webapp 和 database
- 1个secret （HTTPS证书），注入到前端
- 1个configuration （HTTP），注入到前端
- 1个持久volume，连接到后端
- 2个network

``` yaml
services:
  frontend:
    image: example/webapp
    ports:
      - "443:8043"
    networks:
      - front-tier
      - back-tier
    configs:
      - httpd-config
    secrets:
      - server-certificate

  backend:
    image: example/database
    volumes:
      - db-data:/etc/data
    networks:
      - back-tier

volumes:
  db-data:
    driver: flocker
    driver_opts:
      size: "10GiB"

configs:
  httpd-config:
    external: true

secrets:
  server-certificate:
    external: true

networks:
  # The presence of these objects is sufficient to define them
  front-tier: {}
  back-tier: {}
```

docker compose up 命令启动前端和后端服务，创建所需的网络和卷，并将配置和密钥注入到前端服务中。

docker compose ps 提供了当前服务状态的快照，让您轻松查看哪些容器正在运行、它们的状态以及所使用的端口：

``` shell
docker compose ps

NAME                IMAGE                COMMAND                  SERVICE             CREATED             STATUS              PORTS
example-frontend-1  example/webapp       "nginx -g 'daemon ofâ¦"   frontend            2 minutes ago       Up 2 minutes        0.0.0.0:443->8043/tcp
example-backend-1   example/database     "docker-entrypoint.sâ¦"   backend             2 minutes ago       Up 2 minutes
```

## 入门案例

本节程旨在通过指导您开发一个基础的 Python 网络应用，来介绍 Docker Compose 的基本概念。

使用Flask框架，该应用程序在Redis中设置了一个点击计数器，提供了一个Docker Compose在Web开发场景中应用的实际示例。

即使您不熟悉 Python，这里展示的概念也应该是可以理解的。

这是一个非规范性示例，仅突出您可以使用Compose完成的关键事项。

### 先决条件

确保您已：

- 已安装最新版本的 Docker Compose
- 对 Docker 概念及其工作原理的基本了解

### 1.设置

- 为项目创建一个目录：

```shell
mkdir composetest
cd composetest
```

- 在你的项目目录中创建一个名为 app.py 的文件，并粘贴以下代码：

``` python
# 导入必要的库
import time
import redis
from flask import Flask

# 创建Flask应用实例
app = Flask(__name__)

# 创建Redis客户端连接实例，假设Redis服务运行在名为'redis'的主机上，端口号为6379
cache = redis.Redis(host='redis', port=6379)

# 定义一个获取访问计数的函数
def get_hit_count():
    retries = 5  # 重试次数
    while True:
        try:
            # 尝试递增'hits'键的值，若'hits'键不存在，则Redis会自动初始化为0并递增
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            # 如果发生Redis连接错误，检查是否还有重试次数
            if retries == 0:
                # 如果没有剩余重试次数，则抛出异常
                raise exc
            retries -= 1  # 减少重试次数
            time.sleep(0.5)  # 等待0.5秒后重试

# 创建一个路由，当访问根路径时执行hello()函数
@app.route('/')
def hello():
    # 调用get_hit_count()函数，获取当前访问次数
    count = get_hit_count()
    # 返回一个包含访问次数的字符串作为响应
    return f'Hello World! I have been seen {count} times.\n'

```

在此示例中，redis 是应用程序网络中 redis 容器的主机名，并使用默认端口 6379。

!!! note

	请注意 `get_hit_count` 函数的编写方式。这个基本的重试循环会在 Redis 服务不可用时多次尝试请求。这在应用启动时非常有用，因为应用正在上线，同时如果在应用的生命周期内需要重启 Redis 服务，这也使应用更加具有弹性。在集群中，这也有助于处理节点之间的瞬时连接中断。

在你的项目目录中创建一个名为 requirements.txt 的文件，并粘贴以下代码：

```txt
flask
redis
```

创建一个 Dockerfile，并粘贴以下代码：

``` dockerfile
# syntax=docker/dockerfile:1
# 从 Python 3.10 镜像开始构建一个镜像。
FROM python:3.10-alpine
# 将工作目录设置为 /code。
WORKDIR /code
# 设置 flask 命令使用的环境变量。
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# 安装 gcc 和其他依赖项
RUN apk add --no-cache gcc musl-dev linux-headers
# 复制requirements.txt并安装Python依赖项。
COPY requirements.txt requirements.txt
# 为image添加元数据，以描述容器正在监听端口5000
RUN pip install -r requirements.txt
EXPOSE 5000
# 将项目中的当前目录 . 复制到镜像中的工作目录 .。
COPY . .
# 将容器的默认命令设置为 flask run --debug。
CMD ["flask", "run", "--debug"]
```

!!! note

	请确保 `Dockerfile` 没有像 `.txt` 这样的文件扩展名。一些编辑器可能会自动添加这些扩展名，这会导致在运行应用程序时出现错误。

### 2.在 Compose 文件中定义服务

Compose 简化了对整个应用程序栈的控制，使您能够在一个易于理解的 YAML 配置文件中轻松管理服务、网络和卷。

在你的项目目录中创建一个名为 compose.yaml 的文件，并粘贴以下内容：

``` yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
  redis:
    image: "redis:alpine"
```

此 Compose 文件定义了两个服务：`web` 和 `redis`。

该`web`服务使用从当前目录中的 Dockerfile 构建的镜像。然后，它将容器和主机绑定到暴露的端口 8000。此示例服务使用 Flask
网络服务器的默认端口 5000。

`redis` 服务使用从 Docker Hub 注册表拉取的公共 Redis 镜像。

### 3.使用 Compose 构建并运行您的应用

只需一个命令，您就可以从配置文件中创建并启动所有服务。

在您的项目目录中，通过运行 `docker compose up` 启动您的应用程序。

``` shell
docker compose up

Creating network "composetest_default" with the default driver
Creating composetest_web_1 ...
Creating composetest_redis_1 ...
Creating composetest_web_1
Creating composetest_redis_1 ... done
Attaching to composetest_web_1, composetest_redis_1
web_1    |  * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
redis_1  | 1:C 17 Aug 22:11:10.480 # oO0OoO0OoO0Oo Redis is starting oO0OoO0OoO0Oo
redis_1  | 1:C 17 Aug 22:11:10.480 # Redis version=4.0.1, bits=64, commit=00000000, modified=0, pid=1, just started
redis_1  | 1:C 17 Aug 22:11:10.480 # Warning: no config file specified, using the default config. In order to specify a config file use redis-server /path/to/redis.conf
web_1    |  * Restarting with stat
redis_1  | 1:M 17 Aug 22:11:10.483 * Running mode=standalone, port=6379.
redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING: The TCP backlog setting of 511 cannot be enforced because /proc/sys/net/core/somaxconn is set to the lower value of 128.
web_1    |  * Debugger is active!
redis_1  | 1:M 17 Aug 22:11:10.483 # Server initialized
redis_1  | 1:M 17 Aug 22:11:10.483 # WARNING you have Transparent Huge Pages (THP) support enabled in your kernel. This will create latency and memory usage issues with Redis. To fix this issue run the command 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' as root, and add it to your /etc/rc.local in order to retain the setting after a reboot. Redis must be restarted after THP is disabled.
web_1    |  * Debugger PIN: 330-787-903
redis_1  | 1:M 17 Aug 22:11:10.483 * Ready to accept connections
```

Compose 拉取一个 Redis 镜像，为您的代码构建一个镜像，并启动您定义的服务。在这种情况下，代码在构建时被静态复制到镜像中。

在浏览器中输入 `http://localhost:8000/` 以查看应用程序的运行情况。

如果这没有解决问题，您也可以尝试访问 http://127.0.0.1:8000。

您应该在浏览器中看到一条消息：

``` shell
Hello World! I have been seen 1 times.
```

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412271754859.png){ loading=lazy }
  <figcaption>网页效果</figcaption>
</figure>


刷新页面。

数字应该递增

``` shell
Hello World! I have been seen 2 times.
```

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412271800913.png){ loading=lazy }
  <figcaption>网页效果</figcaption>
</figure>


切换到另一个终端窗口，输入 docker image ls 来列出本地镜像。

此时列出镜像应返回 redis 和 web。

``` shell
docker image ls

REPOSITORY        TAG           IMAGE ID      CREATED        SIZE
composetest_web   latest        e2c21aa48cc1  4 minutes ago  93.8MB
python            3.4-alpine    84e6077c7ab6  7 days ago     82.5MB
redis             alpine        9d8fa9aa0e5b  3 weeks ago    27.5MB
```

您可以使用 `docker inspect <标签或ID>` 检查镜像。

停止应用程序，可以在第二个终端的项目目录中运行 `docker compose down`，或者在启动应用程序的原始终端中按下 CTRL+C。

### 4.编辑 Compose 文件以使用 Compose Watch

编辑项目目录中的 compose.yaml 文件以使用 watch，这样您可以预览正在运行的 Compose 服务，并在编辑和保存代码时自动更新：

``` yaml
services:
  web:
    build: .
    ports:
      - "8000:5000"
    develop:
      watch:
        - action: sync
          path: .
          target: /code
  redis:
    image: "redis:alpine"
```

每当文件发生更改时，Compose 会将文件同步到容器内 /code 下的相应位置。复制完成后，打包器会在不重启的情况下更新正在运行的应用程序。

!!! note

	要使此示例生效，需要在 Dockerfile 中添加 --debug 选项。Flask 中的 --debug 选项启用自动代码重载，使得可以在无需重启或重建容器的情况下对后端 API 进行开发。更改 .py 文件后，后续的 API 调用将使用新代码，但在这个小示例中，浏览器的用户界面不会自动刷新。大多数前端开发服务器都包含与 Compose 配合使用的原生实时重载支持。

### 5.使用 Compose 重新构建并运行应用程序

在你的项目目录中，输入 `docker compose watch` 或 `docker compose up --watch` 来构建并启动应用程序，同时开启文件监视模式。

``` shell
docker compose watch
```

在网页浏览器中再次检查 Hello World 消息，并刷新页面以查看计数增加。

### 6.更新应用程序

查看 Compose Watch 的实际操作：

- 在 app.py 中更改问候语并保存。例如，将 Hello World! 信息更改为 Hello from Docker!：

``` python
return f'Hello from Docker! I have been seen {count} times.\n'
```

- 请在浏览器中刷新应用程序。问候语应该会更新，计数器仍会递增。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412272211986.png){ loading=lazy }
  <figcaption>更新应用程序</figcaption>
</figure>

- 完成后，运行 docker compose down。

### 7.拆分您的服务

使用多个 Compose 文件可以为不同的环境或工作流程定制 Compose 应用。这对于大型应用程序非常有用，因为这些应用程序可能使用数十个容器，并且其管理权分布在多个团队之间。

- 在你的项目文件夹中，创建一个名为 `infra.yaml` 的新 Compose 文件。
- 请将 Redis 服务从您的 compose.yaml 文件中剪切，并粘贴到新的 `infra.yaml` 文件中。确保在文件顶部添加 services 顶级属性。现在，您的 `infra.yaml` 文件应如下所示：

``` yaml
services:
  redis:
    image: "redis:alpine"
```

在您的 compose.yaml 文件中，添加 include 顶级属性以及 infra.yaml 文件的路径。



## Docker Compose配置文件属性

[参考文档](https://docs.docker.com/reference/compose-file/)

### version属性(已过时)

顶层`version属性`由 Compose 规范定义，以确保向后兼容。

指定 Compose 文件的版本。

!!! warning

	该属性已过时，不推荐再使用

	Compose 不使用`version`来选择具体的模式来验证 Compose 文件，而是倾向于使用最新实现的模式。

	Compose 会验证它是否能够完全解析 Compose 文件。如果某些字段未知，通常是因为 Compose 文件使用了规范的较新版本中定义的字段，你将收到一条警告信息。

### services属性

services是应用程序中计算资源的抽象定义，可以独立于其他组件进行扩展或替换。服务由一组容器支持，平台根据复制需求和放置约束来运行这些容器。由于服务由容器支持，因此它们由一个
Docker 镜像和一组运行时参数定义。服务中的所有容器都是使用这些参数以相同方式创建的。

Compose 文件必须声明一个顶级元素 services，作为一个映射，其中的`键`是`服务名称`的字符串表示，`值`是`服务定义`
。服务定义包含应用于每个服务容器的配置。

每个服务还可以包含一个`build`部分，用于定义如何创建该服务的 Docker 镜像。Compose 支持使用此服务定义来构建 Docker 镜像。如果不使用，
`build`部分将被忽略，Compose 文件仍被视为有效。构建支持是 Compose 规范的一个可选部分，详细信息在 Compose 构建规范文档中描述。

每个服务定义了运行其容器的运行时约束和要求。`deploy` 部分将这些约束进行分组，并允许平台调整部署策略，以最佳方式匹配容器的需求与可用资源。deploy支持是
Compose 规范的一个可选方面，在 Compose 部署规范文档中有详细描述。如果未实现，deploy 部分将被忽略，Compose 文件仍被视为有效。

#### image属性

指定镜像

#### build属性

基于Dockerfile文件构建镜像时使用的属性

##### context属性

context 定义为包含 Dockerfile 的目录路径或指向 git 仓库的 URL。

当提供的值是相对路径时，它会被解释为相对于项目目录的路径。Compose 会警告您使用绝对路径来定义构建上下文，因为这会阻碍
Compose 文件的可移植性。

``` yaml
build:
  context: ./dir
```

``` yaml
services:
  webapp:
    build: https://github.com/mycompany/webapp.git
```

##### dockerfile属性

dockerfile 设置一个备用的 Dockerfile。相对路径是从构建上下文中解析的。Compose 会警告你使用绝对路径定义 Dockerfile，因为这会阻碍
Compose 文件的可移植性。

设置后，不允许使用 `dockerfile_inline 属性`，并且 Compose 会拒绝任何同时设置了这两个属性的 Compose 文件。

``` yaml
build:
  context: .
  dockerfile: webapp.Dockerfile
```

##### args属性

args 定义构建参数，即 Dockerfile 中的 `ARG` 值。

以下面的 Dockerfile 为例：

``` dockerfile
ARG GIT_COMMIT
RUN echo "Based on commit: $GIT_COMMIT"
```

可以在 Compose 文件中的 build 键下设置 args 来定义 GIT_COMMIT。args 可以设置为映射或列表：

``` yaml
build:
  context: .
  args:
    GIT_COMMIT: cdc3b19
```

``` yaml
build:
  context: .
  args:
    - GIT_COMMIT=cdc3b19
```

在指定构建参数时可以省略其值，此时必须通过用户交互在构建时获取其值，否则在构建 Docker 镜像时，该构建参数将不会被设置。

``` yaml
args:
  - GIT_COMMIT
```

#### ports属性

`ports`用于定义主机与容器之间的端口映射。这对于允许外部访问容器内运行的服务至关重要。可以使用简写语法来定义简单的端口映射，或使用长语法，其中包括协议类型和网络模式等附加选项。

!!! note

	如果使用 `network_mode: host`，则不得使用端口映射，否则会发生运行时错误。

#### network_mode属性

network_mode 设置服务容器的网络模式。

- `none`：关闭所有容器网络。
- `host`：使容器直接访问主机的网络接口。
- `service:{name}`：通过服务名称让容器访问指定的容器。
- `container:{name}`：通过容器ID让容器访问指定的容器。

``` yaml
    network_mode: "host"
    network_mode: "none"
    network_mode: "service:[service name]"
```

设置后，不允许使用 `networks 属性`，Compose 会拒绝任何同时包含这两个属性的 Compose 文件。

#### environment属性

`environment属性`定义了在容器中设置的环境变量。environment可以使用数组或映射的形式。任何布尔值，如true、false、yes、no，都应加上引号，以确保它们不会被YAML解析器转换为True或False。

环境变量可以仅通过一个键声明（没有等号后的值）。在这种情况下，Compose 依赖您来解析该值。如果值未解析，该变量将被取消设置并从服务容器环境中移除。

Map语法：

``` yaml
environment:
  RACK_ENV: development
  SHOW: "true"
  USER_INPUT:
```

数组语法：

``` yaml
environment:
  - RACK_ENV=development
  - SHOW=true
  - USER_INPUT
```

当为服务同时设置了 `env_file` 和 `environment` 时，`environment` 设置的值优先。

#### volumes属性

`volumes 属性`定义了服务容器可以访问的`主机路径`或`命名卷`。您可以使用卷来定义多种类型的挂载：volume、bind、tmpfs 或 npipe。

如果挂载是一个`主机路径`且仅被单个服务使用，可以在服务定义中声明它。要`在多个服务之间重用卷`，必须在顶级元素 volumes
中声明一个命名卷。

以下示例展示了后端服务使用的命名卷（db-data），以及为单个服务定义的绑定挂载。

``` yaml
services:
  backend:
    image: example/backend
    volumes:
      - type: volume
        source: db-data
        target: /data
        volume:
          nocopy: true
          subpath: sub
      - type: bind
        source: /var/run/postgres/postgres.sock
        target: /var/run/postgres/postgres.sock

volumes:
  db-data:
```

#### healthcheck属性

`healthcheck 属性`声明了一项检查，用于判断服务容器是否`healthy`。它的工作方式与服务的 Docker 镜像中设置的 HEALTHCHECK
Dockerfile 指令相同，并具有相同的默认值。您的 Compose 文件可以覆盖 Dockerfile 中设置的值。

``` yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost"]
  interval: 1m30s
  timeout: 10s
  retries: 3
  start_period: 40s
  start_interval: 5s
```

`interval`、`timeout`、`start_period` 和 `start_interval` 都是以持续时间的形式指定的。这些参数在 Docker Compose 版本 2.20.2
中引入。

`test` 定义了 Compose 用于检查容器健康状况的`命令`。它可以是一个字符串或一个列表。如果是列表，第一个项目必须是 `NONE`、`CMD`
或 `CMD-SHELL` 之一。如果是`字符串`，则相当于指定 `CMD-SHELL` 后跟该`字符串`。

``` yaml
# Hit the local web app
test: ["CMD", "curl", "-f", "http://localhost"]
```

使用 `CMD-SHELL` 时，会通过容器的默认 shell（Linux 上为 /bin/sh）以字符串形式运行配置的命令。以下两种形式是等效的：

``` yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```

``` yaml
test: ["CMD-SHELL", "curl -f http://localhost || exit 1"]
```

`NONE` 会禁用健康检查，这主要用于禁用服务的 Docker 镜像中设置的 Healthcheck Dockerfile 指令。或者，可以通过设置 disable:
true 来禁用镜像设置的健康检查：

``` yaml
healthcheck:
  disable: true
```

#### depends_on属性

通过使用`depends_on属性`，您可以控制服务的启动和关闭顺序。如果服务之间紧密耦合，并且启动顺序会影响应用程序的功能，这将非常有用。

##### 简写语法

简写语法变体仅指定依赖项的服务名称。服务依赖性会导致以下行为：

- Compose 按照依赖顺序创建服务。在下面的例子中，db 和 redis 会在 web 之前创建。
- Compose 按依赖顺序移除服务。在以下示例中，web 会在 db 和 redis 之前被移除。

``` yaml
services:
  web:
    build: .
    depends_on:
      - db
      - redis
  redis:
    image: redis
  db:
    image: postgres
```

Compose确保在启动依赖服务之前，依赖的服务已经启动。Compose会等待依赖服务`就绪`后再启动依赖服务。

##### 长语法

长格式语法允许配置无法用短格式表达的附加字段。

- `restart`：当设置为 true 时，Compose 会在更新依赖服务后重启此服务。这适用于由 Compose
  操作控制的显式重启，不包括容器在终止后由容器运行时自动重启的情况。此功能在 Docker Compose 版本 2.17.0 中引入。
- `condition`：设置满足依赖关系的条件
	- `service_started`：上述简写语法的等效形式
	- `service_healthy`：指定在启动依赖服务之前，预期依赖项的状态为`healthy`（由healthcheck指示）。
	- `service_completed_successfully`：指定某个依赖项应在启动依赖服务之前成功完成。
- `required`：设置为 false 时，当依赖服务未启动或不可用时，Compose 仅会发出警告。如果未定义，required 的默认值为 true。此功能在
  Docker Compose 版本 2.20.0 中引入。

服务依赖导致以下行为：

- Compose 按照依赖顺序创建服务。在下面的例子中，db 和 redis 会在 web 之前创建。
- Compose 会等待标记为 service_healthy 的依赖项通过健康检查。在以下示例中，db 需要在创建 web 之前达到`healthy`状态。
- Compose 按依赖顺序移除服务。在以下示例中，web 会在 db 和 redis 之前被移除。

``` yaml
services:
  web:
    build: .
    depends_on:
      db:
        condition: service_healthy
        restart: true
      redis:
        condition: service_started
  redis:
    image: redis
  db:
    image: postgres
```

Compose 确保在启动依赖服务之前，先启动其所依赖的服务。对于标记为 service_healthy 的依赖服务，Compose 确保它们在启动依赖服务之前处于
`healthy`状态。

#### links属性

links 定义了与另一个服务中的容器的网络链接。可以指定`服务名称`和`链接别名`（SERVICE:ALIAS），或者仅指定`服务名称`。

``` yaml
web:
  links:
    - db
    - db:database
    - redis
```

链接服务的容器可以通过与别名相同的hostname访问，如果没有指定别名，则使用`服务名称`。

服务之间的通信不需要`links`。当没有设置特定的网络配置时，任何服务都可以通过`default`网络以`服务名称`
访问其他服务。如果服务声明了它们所连接的网络，`links`不会覆盖网络配置，未连接到共享网络的服务将无法通信。Compose 不会警告您配置不匹配。

`links`与`depends_on`一样，也表示服务之间的隐式依赖关系，因此它们决定了服务启动的顺序。

### networks属性

### volumes属性

### configs属性
