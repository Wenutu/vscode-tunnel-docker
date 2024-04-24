![VSCode Tunnel Docker Logo](./images/logo.png)
# vscode-tunnel-docker
## Language
[English](https://github.com/Wenutu/vscode-tunnel-docker/blob/main/README.md) | [中文](https://github.com/Wenutu/vscode-tunnel-docker/blob/main/README_zh_CN.md)

## 🌐 简介
VSCode隧道Docker是一种基于Docker的解决方案，用于部署和管理通过安全隧道访问的VSCode服务器。它提供了一个可从任何地方访问的无缝开发环境。

## 📦 安装
### 使用 Docker Compose
1. 下载 docker-compose.yml
2. 构建并运行容器
```bash
docker-compose up -d
```

### 自行构建
1. 克隆仓库
```bash
git clone https://github.com/Wenutu/vscode-tunnel-docker.git
cd vscode-tunnel-docker
```
2. 创建一个具有您特定配置的 docker-compose.override.yml
```yml
version: '3.8'
services:
  vscode-tunnel:
    environment:
      MACHINE_NAME: your-custom-machine-name
```
3. 构建并运行容器
```
docker-compose up -d
```

## 🔧 使用方法
1. 启动容器后，查看日志以跟踪设置过程
```bash
docker logs vscode-tunnel
```
输出将显示如下：
```less
* Visual Studio Code Server
*
* By using the software, you agree to
* the Visual Studio Code Server License Terms (https://aka.ms/vscode-server-license) and
* the Microsoft Privacy Statement (https://privacy.microsoft.com/en-US/privacystatement).
*
[20xx-xx-xx xx:xx:xx] info Using GitHub for authentication, run `code tunnel user login --provider <provider>` option to change this.
To grant access to the server, please log into https://github.com/login/device and use code xxxx-xxxx

```

1. 登陆 https://github.com/login/device 用上面代码注册
2. 访问 https://vscode.dev/tunnel/{MACHINE_NAME}


