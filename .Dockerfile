# Use Ubuntu as the base image
FROM ubuntu:22.04

# Install necessary packages
RUN apt-get update && \
    apt-get install -y curl git systemd && \
    rm -rf /var/lib/apt/lists/*

# Download and install VSCode CLI
ARG VSCODE_VERSION=latest
RUN curl -fsSL "https://update.code.visualstudio.com/${VSCODE_VERSION}/linux-x64/stable" -o vscode.tar.gz && \
    tar -xzf vscode.tar.gz -C /usr/local/bin && \
    rm -f vscode.tar.gz

# Setup the VSCode tunnel
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Use a non-root user to run the code
RUN useradd -m vscode
USER vscode
WORKDIR /home/vscode

ENTRYPOINT ["/entrypoint.sh"]
