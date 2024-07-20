# 内网穿透-frp

## 概述

frp 是一款高性能的反向代理应用，专注于内网穿透。它支持多种协议，包括 TCP、UDP、HTTP、HTTPS 等，并且具备 P2P 通信功能。使用
frp，您可以安全、便捷地将内网服务暴露到公网，通过拥有公网 IP 的节点进行中转。

## 配置systemd

- 创建`/etc/systemd/system/frps.service`
- 写入内容

```text
[Unit]
# 服务名称，可自定义
Description = frp server
After = network.target syslog.target
Wants = network.target

[Service]
Type = simple
# 启动frps的命令，需修改为您的frps的安装路径
ExecStart = /path/to/frps -c /path/to/frps.toml

[Install]
WantedBy = multi-user.target
```

- 相关命令

```shell
# 启动frp
sudo systemctl start frps
# 停止frp
sudo systemctl stop frps
# 重启frp
sudo systemctl restart frps
# 查看frp状态
sudo systemctl status frps
# 开机启动
sudo systemctl enable frps
```

