FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive

# Install SSH and required tools
RUN apt-get update && apt-get install -y \
    openssh-server \
    sudo \
    curl \
    wget \
    nano \
    vim \
    git \
    htop \
    net-tools \
    iproute2 \
    procps \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/sshd

COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 22

CMD ["/start.sh"]
