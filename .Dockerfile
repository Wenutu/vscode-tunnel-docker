# 使用带有 Node.js 的基础镜像
FROM node:14

# 设置工作目录
WORKDIR /usr/src/app

# 克隆 VSCode 源代码
RUN git clone --depth 1 https://github.com/microsoft/vscode.git .

# 安装依赖
RUN yarn

# 构建 VSCode
RUN yarn run compile

# 启动 VSCode
CMD ["yarn", "run", "web"]
