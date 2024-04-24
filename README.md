<p align="center">
    <img src="./images/logo.png" alt="VSCode Tunnel Docker Logo" width="200" height="200">
    <br>
    <b>vscode-tunnel-docker</b>
</p>

## Language
[English](https://github.com/Wenutu/vscode-tunnel-docker/blob/main/README.md) | [中文](https://github.com/Wenutu/vscode-tunnel-docker/blob/main/README.zh_CN.md)


## 🌐 Description
VSCode Tunnel Docker is a Docker-based solution to deploy and manage a VSCode server accessible through a secure tunnel. It provides a seamless development environment accessible from anywhere.

## 📦 Installation
### Using Docker Compose
1. Download docker-compose.yml
```yml
version: '3.8'

services:
  vscode-tunnel:
    image: wenutu/vscode-tunnel-docker:latest
    container_name: vscode_tunnel
    environment:
      PROVIDER: github  # github, microsoft
      BUILD: stable     # stable, insider
      MACHINE_NAME: vscode-tunnel-docker
    volumes:
      - ./workspace:/root/workspace
      - ./vscode_data:/root/.vscode-server
      - ./vscode_cli_data:/root/.vscode/cli
    restart: unless-stopped

```
2. Build and run the container:
```bash
docker-compose up -d
```

### Build by yoursef
1. Clone the repository:
```bash
git clone https://github.com/Wenutu/vscode-tunnel-docker.git
cd vscode-tunnel-docker
```
2. Create a docker-compose.override.yml with your specific configurations:
```yml
version: '3.8'
services:
  vscode-tunnel:
    environment:
      MACHINE_NAME: your-custom-machine-name
```
3. Build and run the container:
```bash
docker-compose up -d
```

### Docker Environment
| Environment      | value             |
| ------------- | ------------ |
| PROVIDER      | github(microsoft)    |
| BUILD         | stable(insider)      |
| MACHINE_NAME  | vscode-tunnel-docker |



## 🔧 Usage
1. After starting the container, check the logs to follow the setup process:
```bash
docker logs vscode-tunnel
```

Output will look like:
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

2. Log in at https://github.com/login/device and use code above
3. Visit https://vscode.dev/tunnel/{MACHINE_NAME} to access your VSCode workspace.



