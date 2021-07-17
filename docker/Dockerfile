# syntax:docker/dockerfile:1
FROM debian:testing

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      git curl jq \
      vim tmux \
      gcc g++ clang clangd \
      make cmake \
      apt-transport-https ca-certificates gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg \
      | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      > /etc/apt/sources.list.d/docker.list && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y docker-ce-cli nodejs

RUN useradd -ms /bin/bash kevin && \
    usermod -aG sudo kevin && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER kevin
WORKDIR /home/kevin

COPY . .dotfiles
RUN sh ~/.dotfiles/scripts/plug.sh && \
    sh ~/.dotfiles/scripts/tpm.sh && \
    sh ~/.dotfiles/scripts/coc.sh && \
    sh ~/.dotfiles/scripts/symlinks.sh
# RUN echo -e 'PlugInstall\nqa' > /tmp/cmds && \
#     vim -T dumb -n -i NONE -e -S /tmp/cmds && \
#     rm /tmp/cmds
