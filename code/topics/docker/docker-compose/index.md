# Docker Compose

## 概述

Docker Compose通过`docker-compose.yml`文件来定义一组相关联的应用容器，帮助我们实现`多个互相关联的Docker容器的快速部署`。

Docker Compose 是一种用于定义和运行多容器应用程序的工具。它是实现简化高效的开发和部署体验的关键。



## 入门

创建docker compose文件之前先创建一个目录，目录名称一般为项目名称，然后将项目所需的所有镜像、相关Dockerfile放入该目录，并在该目录中构建docker-compose文件。

!!! note

	docker compose yaml文件的命名优先推荐使用`compose.yaml`。

通过docker compose 命令启动容器：

```shell
# 启动容器
# -f: 指定docker-compose.yml文件
# -d: 后台运行
docker-compose up \
-f xxx.yml \
-d

# 停止并移除容器、自定义网络
# -f: 指定docker-compose.yml文件
# -p: 指定容器名称
docker-compose down
```

## DockerCompose参数与docker run 参数对比

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202410122202192.png){ loading=lazy }
  <figcaption>DockerCompose参数与docker run 参数对比</figcaption>
</figure>

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

