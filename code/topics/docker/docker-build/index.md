# Docker Build

## 概述

Docker Build 是 Docker Engine 最常用的功能之一。每当你创建镜像时，都会使用 Docker Build。Build
是软件开发生命周期中的关键部分，它允许你打包和捆绑代码，并将其发送到任何地方。

Docker Build 不仅仅是一个用于构建镜像的命令，也不仅仅是为了打包代码。它是一个完整的工具和功能生态系统，不仅支持常见的工作流程任务，还为更复杂和高级的场景提供支持。

Docker Build 实现了客户端-服务器架构，其中：

- Client：Buildx 是用于运行和管理构建的客户端和用户界面。
- Server：BuildKit 是负责执行构建的服务器或构建器。

当你启动构建时，Buildx 客户端会向 BuildKit 后端发送构建请求。BuildKit 解析构建指令并执行构建步骤。构建输出会被发送回客户端或上传到注册表，例如
Docker Hub。

`Buildx` 和 `BuildKit` 都随 `Docker Desktop` 和 `Docker Engine` 一起安装。 当你调用 `docker build` 命令时，你使用的是
Buildx 来运行使用 Docker 捆绑的默认 BuildKit 的构建。

### Buildx

Buildx 是用于运行构建的命令行工具。`docker build` 命令是 Buildx 的一个封装。当你调用 docker build 时，Buildx
会解析构建选项并将构建请求发送到 `BuildKit 后端`。

Buildx 客户端不仅仅用于运行构建。您还可以使用 Buildx 创建和管理称为构建器的 BuildKit 后端。它还支持在注册表中管理镜像的功能，并支持同时运行多个构建。

Docker Buildx 默认随 Docker Desktop 一起安装。您也可以从源代码构建 CLI 插件，或者从 GitHub 仓库获取二进制文件并手动安装。

!!! note

	虽然 docker build 在底层调用了 Buildx，但该命令与标准的 docker buildx build 存在细微差别。

### BuildKit

BuildKit 是执行构建任务的守护进程。

构建执行从调用 docker build 命令开始。Buildx 解释您的构建命令并向 BuildKit 后端发送构建请求。构建请求包括：

- Dockerfile
- 构建参数
- 导出选项
- 缓存选项

BuildKit 解析构建指令并执行构建步骤。在 BuildKit 执行构建的同时，Buildx 监控构建状态并将进度显示在终端上。

如果构建需要来自客户端的资源，例如本地文件或构建密钥，BuildKit 会向 Buildx 请求所需的资源。

这就是 BuildKit 相较于早期版本 Docker 使用的传统构建器更高效的一个方面。BuildKit 仅在构建需要时才请求所需的资源。而传统构建器则总是复制本地文件系统。

BuildKit 可以从 Buildx 请求的资源示例包括：

- 本地文件系统构建上下文
- 构建密钥
- SSH 套接字
- 注册表身份验证令牌

## Dockerfile入门

### 示例

以下是使用 Docker 构建应用程序的典型工作流程。

以下示例代码展示了一个使用 Flask 框架编写的小型 "Hello World" Python 应用程序。

``` python
from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Hello World!"
```

为了在不使用 Docker Build 的情况下发布和部署此应用程序，您需要确保：

- 服务器上已安装所需的运行时依赖项
- Python代码被上传到服务器的文件系统
- 服务器使用必要的参数启动您的应用程序。

以下 Dockerfile 创建了一个容器镜像，其中安装了所有依赖项，并能自动启动您的应用程序。

``` dockerfile
# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip install flask==3.0.*

# install app
COPY hello.py /

# final configuration
ENV FLASK_APP=hello
EXPOSE 8000
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```

### 1.syntax(可选)

在 Dockerfile 中添加的第一行应该是一个 `# syntax` 解析器指令。虽然是可选的，但这个指令告诉 Docker 构建器在解析 Dockerfile
时使用什么语法，并允许启用 BuildKit 的旧版 Docker 在开始构建之前使用特定的 Dockerfile 前端。`解析器指令`必须出现在任何其他注释、空白或
Dockerfile 指令之前，并且应该是 Dockerfile 中的第一行。

``` dockerfile
# syntax=docker/dockerfile:1
```

!!! note

	我们建议使用 `docker/dockerfile:1`，它始终指向版本1语法的最新发布版本。BuildKit 在构建之前会自动检查语法更新，确保您使用的是最新版本。

### 2.基础镜像

语法指令后面的行定义了要使用的基础镜像：

``` dockerfile
FROM ubuntu:22.04
```

`FROM 指令`将基础镜像设置为 Ubuntu 22.04 版本。接下来的所有指令都将在这个基础镜像中执行，即 Ubuntu 环境。符号 ubuntu:22.04
遵循 Docker 镜像命名的`名称:标签`标准。在构建镜像时，你可以使用这种符号来命名你的镜像。在项目中，你可以利用许多公共镜像，通过在
Dockerfile 中使用 FROM 指令将它们导入到你的构建步骤中。

### 3.环境设置

以下命令在基础镜像中执行构建命令。

``` dockerfile
# install app dependencies
RUN apt-get update && apt-get install -y python3 python3-pip
```

该 `RUN 指令`在 Ubuntu 中执行一个 shell，更新 APT 包索引并在容器中安装 Python 工具。

### 注释

请注意 `# install app dependencies` 这一行。这是一条注释。在 Dockerfile 中，注释以 `#` 符号开头。随着 Dockerfile
的不断演变，注释对于记录文件的工作原理非常重要，方便未来的读者和编辑者（包括未来的你）理解。

!!! note

	您可能已经注意到，注释使用的符号与文件第一行的语法指令相同。只有当该符号的模式匹配指令并出现在 Dockerfile 的开头时，它才会被解释为指令。否则，它将被视为注释。

### 4.安装依赖项

第二条 `RUN 指令`安装 Python 应用所需的 Flask 依赖项。

``` dockerfile
RUN pip install flask==3.0.*
```

要执行此指令的前提条件是构建容器中已安装 pip。第一个 RUN 命令安装了 pip，这确保我们可以使用该命令来安装 Flask Web 框架。

### 5.复制文件

接下来的指令使用 `COPY` 指令将 `hello.py` 文件从本地构建上下文复制到我们镜像的根目录。

``` dockerfile
COPY hello.py /
```

build context 是指在 Dockerfile 指令中可以访问的文件集，例如 COPY 和 ADD。

在 COPY 指令之后，hello.py 文件被添加到构建容器的文件系统中。

### 6.设置环境变量

如果您的应用程序使用环境变量，可以在 Docker 构建中使用 ENV 指令来设置环境变量。

``` dockerfile
ENV FLASK_APP=hello
```

这将设置一个我们稍后需要的 Linux 环境变量。Flask 是在此示例中使用的框架，它利用这个变量来启动应用程序。如果没有这个变量，Flask
将不知道在哪里找到我们的应用程序以运行它。

### 7.开放端口

EXPOSE 指令标记我们的最终镜像在端口 8000 上有一个服务在监听。

``` dockerfile
EXPOSE 8000
```

这项说明不是必需的，但它是一个良好的实践，有助于工具和团队成员理解这个应用程序的功能。

### 8.启动应用程序

最后，CMD 指令设置了用户基于此镜像启动容器时运行的命令。

``` dockerfile
CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8000"]
```

此命令启动Flask开发服务器，在端口8000上监听所有地址。这里的示例使用的是CMD的“exec形式”。也可以使用“shell形式”：

``` dockerfile
CMD flask run --host 0.0.0.0 --port 8000
```

这两个版本之间存在细微差别，例如在捕捉 SIGTERM 和 SIGKILL 信号的方式上。

### 9.构建镜像

要使用上一节中的 Dockerfile 示例构建容器镜像，可以使用 docker build 命令：

``` dockerfile
docker build -t test:latest .
```

`-t test:latest` 选项指定了镜像的名称和标签。

命令末尾的单个点（`.`）将构建上下文设置为当前目录。这意味着构建过程期望在执行命令的目录中找到 `Dockerfile` 和 `hello.py`
文件。如果这些文件不存在，构建将失败。

构建镜像后，您可以使用 docker run 命令运行该应用程序容器，并指定镜像名称：

``` dockerfile
docker run -p 127.0.0.1:8000:8000 test:latest
```

这会将容器的端口8000发布到Docker主机上的http://localhost:8000。

## Build 上下文

docker build 和 docker buildx build 命令从 Dockerfile 和上下文构建 Docker 镜像。

### 什么是Build上下文

build 上下文是构建过程中可以访问的一组文件。传递给构建命令的位置参数指定了您希望用于构建的上下文：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412251428899.png){ loading=lazy }
  <figcaption>Build context</figcaption>
</figure>

您可以将以下任意输入作为构建的上下文：

- 本地目录的相对路径或绝对路径
- Git 仓库、压缩包或纯文本文件的远程 URL
- 通过标准输入传递给 `docker build` 命令的纯文本文件或 tarball 文件。

### 本地上下文

要使用本地构建上下文，可以在 docker build 命令中指定相对或绝对文件路径。以下示例展示了一个使用当前目录（`.`）作为构建上下文的构建命令：

``` dockerfile
docker build .
...
#16 [internal] load build context
#16 sha256:23ca2f94460dcbaf5b3c3edbaaa933281a4e0ea3d92fe295193e4df44dc68f85
#16 transferring context: 13.16MB 2.2s done
...
```

这使当前工作目录中的文件和目录对构建器可用。构建器在需要时从构建上下文中加载所需的文件。

#### 本地目录

请考虑以下目录结构：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412251439232.png){ loading=lazy }
  <figcaption>本地目录</figcaption>
</figure>

如果您将此目录作为上下文传递，Dockerfile 指令可以在构建过程中引用并包含这些文件。

``` dockerfile
# syntax=docker/dockerfile:1
FROM node:latest
WORKDIR /src
COPY package.json package-lock.json .
RUN npm ci
COPY index.ts src .
```

```shell
docker build .
```

#### 从标准输入中获取 Dockerfile 的本地上下文

使用以下语法通过本地文件系统中的文件构建镜像，同时从标准输入中使用 Dockerfile。

``` shell
docker build -f- <PATH>
```

该语法使用 -f（或 --file）选项来指定要使用的 Dockerfile，并使用连字符（-）作为文件名，指示 Docker 从标准输入读取 Dockerfile。

以下示例使用当前目录 (.) 作为构建上下文，并通过 here-document 从标准输入传递 Dockerfile 来构建镜像。

``` shell
# 创建一个工作目录
mkdir example
cd example

# create an example file
touch somefile.txt

# 使用当前目录作为上下文构建镜像 
# 并通过标准输入传递 Dockerfile
docker build -t myimage:latest -f- . <<EOF
FROM busybox
COPY somefile.txt ./
RUN cat /somefile.txt
EOF
```

#### 本地压缩包

当你将一个压缩包通过管道传递给构建命令时，构建会将压缩包的内容用作文件系统上下文。

例如，给定以下项目目录：

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412251456737.png){ loading=lazy }
  <figcaption>项目目录</figcaption>
</figure>

您可以将目录打包成一个 tarball，并通过管道传输到构建中用作上下文：

``` shell
tar czf foo.tar.gz *
docker build - < foo.tar.gz
```

构建过程从压缩包上下文中解析 Dockerfile。您可以使用 --file 标志来指定 Dockerfile 相对于压缩包根目录的名称和位置。以下命令使用压缩包中的
test.Dockerfile 进行构建：

``` shell
docker build --file test.Dockerfile - < foo.tar.gz
```

### 远程上下文

您可以将远程 Git 仓库、压缩包或纯文本文件的地址指定为您的构建上下文。

#### git仓库

当你将指向 Git 仓库位置的 URL 作为参数传递给 `docker build` 时，构建器会将该仓库用作构建上下文。

构建器执行浅克隆操作，仅下载仓库的HEAD提交，而不是整个历史记录。

构建器会递归克隆仓库及其包含的任何子模块。

``` shell
docker build https://github.com/user/myrepo.git
```

默认情况下，构建器会克隆您指定的存储库默认分支上的最新提交。

您可以在 Git 仓库地址后附加 URL 片段，以使构建器克隆仓库的特定分支、标签和子目录。

URL片段的格式为#ref:dir，其中：

- `ref` 是分支名称、标签或提交哈希值
- `dir` 是存储库中的一个子目录

例如，以下命令使用容器分支及其分支中的 docker 子目录作为构建上下文：

``` shell
docker build https://github.com/user/myrepo.git#container:docker
```

下表列出了所有有效后缀及其构建上下文：

| Build语法后缀                    | Commit Used                 | Build 上下文 |
|------------------------------|-----------------------------|-----------|
| myrepo.git                   | refs/heads/<default branch> | /         |
| myrepo.git#mytag             | refs/tags/mytag             | /         |
| myrepo.git#mybranch          | refs/heads/mybranch         | /         |
| myrepo.git#pull/42/head      | refs/pull/42/head           | /         |
| myrepo.git#:myfolder         | refs/heads/<default branch> | /myfolder |
| myrepo.git#master:myfolder   | refs/heads/master           | /myfolder |
| myrepo.git#mytag:myfolder    | refs/tags/mytag             | /myfolder |
| myrepo.git#mybranch:myfolder | refs/heads/mybranch         | /myfolder |

当您在URL片段中使用提交哈希作为引用时，请使用完整的40字符长度的SHA-1哈希值。短哈希（例如截断为7个字符的哈希）是不支持的。

``` shell
# ✅正确做法:
docker build github.com/docker/buildx#d4f088e689b41353d74f1a0bfcd6d7c0b213aed2
# ❌以下内容不起作用，因为提交哈希被截断了:
docker build github.com/docker/buildx#d4f088e
```

默认情况下，使用 Git 上下文时，BuildKit 不会保留 `.git` 目录。您可以通过设置 `BUILDKIT_CONTEXT_KEEP_GIT_DIR` 构建参数来配置
BuildKit 保留该目录。如果您希望在构建过程中获取 Git 信息，这可能会很有用：

``` dockerfile
# syntax=docker/dockerfile:1
FROM alpine
WORKDIR /src
RUN --mount=target=. \
  make REVISION=$(git rev-parse HEAD) build
```

``` shell
docker build \
  --build-arg BUILDKIT_CONTEXT_KEEP_GIT_DIR=1
  https://github.com/user/myrepo.git#main
```

当您指定一个同时是私有仓库的 Git 上下文时，构建器需要您提供必要的身份验证凭据。您可以使用 SSH 或基于令牌的身份验证。

Buildx 会自动检测并使用 SSH 凭证，如果你指定的 Git 上下文是 SSH 或 Git 地址。默认情况下，它使用 $SSH_AUTH_SOCK。你可以使用
--ssh 标志配置要使用的 SSH 凭证。

``` shell
docker buildx build --ssh default git@github.com:user/private.git
```

如果你想使用基于令牌的身份验证，可以使用 --secret 标志传递令牌。

``` shell
GIT_AUTH_TOKEN=<token> docker buildx build \
  --secret id=GIT_AUTH_TOKEN \
  https://github.com/user/private.git
```

!!! warning

	不要使用 --build-arg 来传递机密信息。

#### 通过标准输入的 Dockerfile 进行远程上下文

使用以下语法通过本地文件系统中的文件构建镜像，同时从标准输入中使用 Dockerfile。

``` shell
docker build -f- <URL>
```

该语法使用 -f（或 --file）选项来指定要使用的 Dockerfile，并使用连字符（-）作为文件名，指示 Docker 从标准输入读取 Dockerfile。

这在以下情况下会很有用：当你想从一个不包含 Dockerfile 的仓库构建镜像时，或者如果你想使用自定义的 Dockerfile
构建，而不需要维护仓库的分支。

以下示例通过从标准输入读取的 Dockerfile 构建一个镜像，并添加来自 GitHub 上 hello-world 仓库的 hello.c 文件。

``` shell
docker build -t myimage:latest -f- https://github.com/docker-library/hello-world.git <<EOF
FROM busybox
COPY hello.c ./
EOF
```

#### 远程压缩包

远程压缩包 如果你传递一个远程压缩包的URL，该URL会被发送给构建器。

``` shell
docker build http://server/context.tar.gz
#1 [internal] load remote build context
#1 DONE 0.2s

#2 copy /context /
#2 DONE 0.1s
...
```

下载操作将在运行 BuildKit 守护进程的主机上执行。请注意，如果您使用的是远程 Docker 上下文或远程构建器，这不一定与您发出构建命令的机器相同。BuildKit 会获取 context.tar.gz 并将其用作构建上下文。压缩包上下文必须是符合标准 Unix tar 格式的 tar 存档，并且可以使用 xz、bzip2、gzip 或 identity（无压缩）格式进行压缩。

### 空上下文

当您使用文本文件作为构建上下文时，构建器会将该文件解释为Dockerfile。使用文本文件作为上下文意味着构建没有文件系统上下文。

当您的 Dockerfile 不依赖任何本地文件时，可以使用空的构建上下文进行构建。

您可以通过标准输入流传递文本文件，或者指向远程文本文件的URL。

=== "Unix pipe"

	``` shell
	docker build - < Dockerfile
	```

=== "PowerShell"

	``` shell
	Get-Content Dockerfile | docker build -
	```

=== "Heredocs"

	``` shell
	docker build -t myimage:latest - <<EOF
	FROM busybox
	RUN echo "hello world"
	EOF
	```

=== "Remote file"

	``` shell
	docker build https://raw.githubusercontent.com/dvdksn/clockbox/main/Dockerfile
	```

当您在没有文件系统上下文的情况下构建时，Dockerfile 指令如 COPY 无法引用本地文件：

```shell
ls
main.c
docker build -<<< $'FROM scratch\nCOPY main.c .'
[+] Building 0.0s (4/4) FINISHED
 => [internal] load build definition from Dockerfile       0.0s
 => => transferring dockerfile: 64B                        0.0s
 => [internal] load .dockerignore                          0.0s
 => => transferring context: 2B                            0.0s
 => [internal] load build context                          0.0s
 => => transferring context: 2B                            0.0s
 => ERROR [1/1] COPY main.c .                              0.0s
------
 > [1/1] COPY main.c .:
------
Dockerfile:2
--------------------
   1 |     FROM scratch
   2 | >>> COPY main.c .
   3 |
--------------------
ERROR: failed to solve: failed to compute cache key: failed to calculate checksum of ref 7ab2bb61-0c28-432e-abf5-a4c3440bc6b6::4lgfpdf54n5uqxnv9v6ymg7ih: "/main.c": not found
```

### .dockerignore

您可以使用 .dockerignore 文件来排除构建上下文中的文件或目录。

```
# .dockerignore
node_modules
bar
```

这有助于避免将不需要的文件和目录发送给构建器，从而提高构建速度，特别是在使用远程构建器时。

当你运行构建命令时，构建客户端会在上下文的根目录中查找名为`.dockerignore`的文件。如果该文件存在，匹配文件中模式的文件和目录将在发送给构建器之前从构建上下文中移除。

如果你使用多个 Dockerfile，可以为每个 Dockerfile 使用不同的忽略文件。你可以通过一种特殊的命名约定来实现这一点。将忽略文件放在与 Dockerfile 相同的目录中，并在忽略文件名前加上 Dockerfile 的名称，如下例所示。

<figure markdown="span">
  ![](https://raw.githubusercontent.com/luguosong/images/master/blog-img/202412251649880.png){ loading=lazy }
  <figcaption>目录结构</figcaption>
</figure>

如果同时存在，Dockerfile 特定的忽略文件优先于构建上下文根目录下的 .dockerignore 文件。

.dockerignore 文件是一个以换行符分隔的模式列表，类似于 Unix shell 的文件通配符。忽略模式中的前导和尾随斜杠会被忽略。以下模式都会排除在构建上下文根目录下的子目录 foo 中名为 bar 的文件或目录：

- `/foo/bar/`
- `/foo/bar`
- `foo/bar/`
- `foo/bar`

如果 .dockerignore 文件中的一行在第 1 列以 # 开头，那么该行被视为注释，并在 CLI 解释之前被忽略。

```
#/this/is/a/comment
```

## history-查看镜像分层

Docker 镜像由多个层组成。每一层都是 Dockerfile 中构建指令的结果。这些层按顺序堆叠，每一层都是对前一层所做更改的增量。

``` shell
docker history 镜像名称
```

## Dockerfile文件

Docker 可以通过读取 Dockerfile 中的指令自动构建镜像。Dockerfile 是一个文本文件，其中包含用户可以在命令行上调用以组装镜像的所有命令。

Dockerfile 是镜像构建的重要输入，可以根据您的独特配置促进自动化的多层镜像构建。Dockerfile 可以从简单开始，并随着您的需求增长，以支持更复杂的场景。

### 命名规范

Dockerfile 的默认文件名是 `Dockerfile`，没有文件扩展名。使用默认名称可以让你在运行 `docker build` 命令时无需指定额外的命令标志。

某些项目可能需要为特定用途准备不同的 Dockerfile。一个常见的命名惯例是将这些文件命名为 `<something>.Dockerfile`。你可以在
docker build 命令中使用 `--file` 标志来指定 Dockerfile 的文件名。

### 指令汇总

| Instruction | Description (中文翻译)                                                                  |
|-------------|-------------------------------------------------------------------------------------|
| ADD         | 添加本地或远程文件和目录。                                                                       |
| ARG         | 使用构建时变量。                                                                            |
| CMD         | 指定默认命令。允许您定义启动基于此镜像的容器时运行的默认程序。每个 Dockerfile 只能有一个 CMD，当存在多个 CMD 时，只有最后一个 CMD 会被执行。 |
| COPY        | 复制文件和目录。                                                                            |
| ENTRYPOINT  | 指定默认可执行文件。                                                                          |
| ENV         | 设置环境变量。                                                                             |
| EXPOSE      | 描述应用程序监听的端口。                                                                        |
| FROM        | 基于基础镜像创建一个新的构建阶段。                                                                   |
| HEALTHCHECK | 在启动时检查容器的健康状态。                                                                      |
| LABEL       | 向镜像添加元数据。                                                                           |
| MAINTAINER  | 指定镜像的作者。                                                                            |
| ONBUILD     | 当镜像在构建时使用时，指定要执行的指令。                                                                |
| RUN         | 执行构建命令。在当前image 之上执行任何命令并提交结果。RUN 也有用于运行命令的 shell 形式。                               |
| SHELL       | 设置镜像的默认Shell。                                                                       |
| STOPSIGNAL  | 指定用于退出容器的系统调用信号。                                                                    |
| USER        | 设置用户和组ID。                                                                           |
| VOLUME      | 创建卷挂载点。                                                                             |
| WORKDIR     | 更改工作目录。                                                                             |

### FROM指令

### ADD指令

### COPY指令

### MAINTAINER指令(已过时)

### LABEL指令

### ENV指令

### WORKDIR指令

### RUN指令

### CMD指令
