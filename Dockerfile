# Base image
FROM ubuntu:22.04

# Maintainer and metadata labels
LABEL maintainer.name="Wenutu Shi" \
      maintainer.email="wenutushi@gmail.com" \
      version="1.0.0" \
      description="VSCode remote tunnels Docker image deployable anywhere."

RUN useradd -ms /bin/bash vscode && echo "vscode:vscode" | chpasswd
RUN echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Setting the working directory
WORKDIR /home/vscode

# Environment variables
ENV MACHINE_NAME=vscode-remote

# Arguments for architecture and build
ARG TARGETARCH
ARG BUILD=stable

# Copying necessary scripts
COPY src/download_vscode /usr/local/bin/download_vscode
COPY src/entrypoint /usr/local/bin/entrypoint
USER root
RUN chmod +x /usr/local/bin/download_vscode /usr/local/bin/entrypoint
# Installing necessary packages and cleaning up in one RUN to minimize image size
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tzdata \
    curl \
    ca-certificates \
    git \
    build-essential && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* && \
    /usr/local/bin/download_vscode $TARGETARCH $BUILD

USER vscode

ENTRYPOINT ["entrypoint"]
