# syntax:docker/dockerfile:1
FROM debian:stable-backports

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y \
      sudo man file tree locales xz-utils bzip2 unzip \
      git curl jq \
      vim tmux \
      gcc g++ clang clangd \
      make cmake \
      silversearcher-ag fzf \
      awscli \
      openjdk-17-jdk rlwrap \
      apt-transport-https ca-certificates gnupg lsb-release && \
    curl -fsSL https://get.docker.com | bash - && \
    curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && \
    curl -fsSL https://download.clojure.org/install/linux-install-1.10.3.1087.sh | bash - && \
    curl -fsSL https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install | bash - && \
    [ "$(uname -m)" = "x86_64" ] && { \
      curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb -o /tmp/nvim.deb && \
      apt install -y /tmp/nvim.deb; \
    } || apt-get install -y neovim && \
    apt-get install -y nodejs && \
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
RUN ~/.dotfiles/scripts/plug.sh && \
    ~/.dotfiles/scripts/packer.sh && \
    ~/.dotfiles/scripts/tpm.sh && \
    ~/.dotfiles/scripts/coc.sh && \
    ~/.dotfiles/scripts/symlinks.sh && \
    vim +PlugInstall +qa

VOLUME ["/home/kevin/projects"]
ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
