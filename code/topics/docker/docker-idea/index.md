# IDEA中使用Docker

IntelliJ IDEA 集成了 Docker 功能，提供了创建 Docker 镜像、运行 Docker 容器、管理 Docker Compose 应用程序、使用公共和私有
Docker 注册表等多种支持，所有这些都可以直接在 IDE 中完成。

## 准备

### 启用 Docker 插件

此功能依赖于 Docker 插件，该插件在 IntelliJ IDEA 中默认捆绑并启用。如果相关功能不可用，请确保您没有禁用该插件。

!!! note

	Docker 插件默认仅在 IntelliJ IDEA Ultimate 中可用。对于 IntelliJ IDEA 社区版，您需要按照安装插件的说明来安装 Docker 插件。

- 按 `Ctrl` + `Alt` + `S`打开设置，然后选择插件。
- 打开`已安装`选项卡，找到 Docker 插件，并勾选插件名称旁边的复选框。

### 安装并运行 Docker

请按照 Docker 文档中的说明安装并运行 Docker。

IntelliJ IDEA 支持替代的 Docker 守护进程：[Colima](https://github.com/abiosoft/colima) 和 [Rancher Desktop](https://rancherdesktop.io/)（使用 dockerd 引擎）。

### 连接到Docker守护进程

- 按 `Ctrl` + `Alt` + `S` 打开设置，然后选择 `构建、执行、部署` | `Docker`。
- 单击`+`以添加 Docker 配置，并指定如何连接到 Docker 守护进程。

连接设置取决于您的 Docker 版本和操作系统。有关更多信息，请参阅 Docker 连接设置。

连接成功的消息应出现在对话框的底部。
