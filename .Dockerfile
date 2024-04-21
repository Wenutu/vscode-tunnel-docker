# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && apt-get install -y curl sudo

# 
RUN useradd -m vscode -s /bin/bash \
    && echo "vscode ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vscode

# Download and install VSCode CLI
ARG VSCODE_VERSION=latest
RUN curl -fsSL "https://update.code.visualstudio.com/${VSCODE_VERSION}/cli-alpine-x64/stable" -o vscode-cli.tar.gz && \
    tar -xzf vscode-cli.tar.gz -C /usr/local/bin && \
    rm -f vscode-cli.tar.gz

# Setup the VSCode tunnel
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use a non-root user to run the code
RUN useradd -m vscode
USER vscode
WORKDIR /home/workspace

ENTRYPOINT ["/entrypoint.sh"]
