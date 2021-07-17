# syntax:docker/dockerfile:1
FROM debian:testing

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      sudo man file tree locales xz-utils bzip2 \
      git curl jq \
      vim tmux \
      gcc g++ clang clangd \
      make cmake \
      silversearcher-ag fzf \
      awscli \
      apt-transport-https ca-certificates gnupg lsb-release && \
    curl -fsSL https://download.docker.com/linux/debian/gpg \
      | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
      "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
      > /etc/apt/sources.list.d/docker.list && \
    curl -fsSL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y docker-ce-cli nodejs && \
    useradd -ms /bin/bash kevin && \
    usermod -aG sudo kevin && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
USER kevin
WORKDIR /home/kevin

COPY --chown=kevin:kevin . .dotfiles
COPY --chown=kevin:kevin docker/docker-setup.sh docker-setup.sh
RUN sh ~/.dotfiles/scripts/plug.sh && \
    sh ~/.dotfiles/scripts/tpm.sh && \
    sh ~/.dotfiles/scripts/coc.sh && \
    sh ~/.dotfiles/scripts/symlinks.sh && \
    vim +PlugInstall +qa

VOLUME ["/home/kevin/projects"]
ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
