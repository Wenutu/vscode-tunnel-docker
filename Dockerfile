# Base image
FROM ubuntu:22.04

# Maintainer and metadata labels
LABEL maintainer.name="Wenutu Shi" \
      maintainer.email="wenutushi@gmail.com" \
      version="1.0.0" \
      description="VSCode remote tunnels Docker image deployable anywhere."

# Setting the working directory
WORKDIR /root/workspace

# Environment variables
ENV MACHINE_NAME=vscode-tunnel-docker

# Arguments for architecture and build
ARG TARGETARCH
ARG BUILD=stable #TODO: Build insiders image

# Copying necessary scripts
COPY src/download_vscode /usr/local/bin/download_vscode
COPY src/entrypoint /usr/local/bin/entrypoint
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

ENTRYPOINT ["entrypoint"]
