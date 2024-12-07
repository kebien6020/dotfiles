# syntax:docker/dockerfile:1
FROM archlinux:base-devel

RUN pacman -Syu --noconfirm
RUN pacman -S --noconfirm \
      sudo binutils file tree tzdata xz bzip2 unzip zstd htop \
      base-devel glibc pacman-contrib git curl jq \
      vim neovim tmux \
      gcc clang rustup \
      go gopls \
      make cmake \
      the_silver_searcher fzf \
      aws-cli \
      jdk-openjdk rlwrap \
      ca-certificates gnupg lsb-release \
      docker docker-buildx dive nodejs typescript-language-server \
      clojure yaml-language-server lua-language-server && \
    useradd -ms /bin/bash kevin && \
    usermod -aG wheel kevin && \
    echo '%wheel ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    locale-gen && \
    ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime && \
	paccache -rk0
USER kevin
WORKDIR /home/kevin

RUN rustup toolchain install nightly && \
    rustup default nightly && \
	rustup component add rust-analyzer && \
	rustup component remove rust-docs

RUN mkdir -p src/ && \
	cd src/ && \
    git clone https://aur.archlinux.org/paru.git && \
    cd paru && \
    makepkg -si --noconfirm && \
	rm -rf ~/.cargo

RUN paru -S --noconfirm \
      clojure-lsp-bin jdtls

COPY --chown=kevin:kevin . .dotfiles
COPY --chown=kevin:kevin docker/docker-setup.sh docker-setup.sh
RUN ~/.dotfiles/scripts/packer.sh && \
    ~/.dotfiles/scripts/tpm.sh && \
    ~/.dotfiles/scripts/symlinks.sh

VOLUME ["/home/kevin/projects"]
ENV TERM=xterm-256color \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
