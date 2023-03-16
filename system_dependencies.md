# Deps

This is a general list of dependencies just generally expected to exist in the
system. In rough order of how much I need them for my workflow.

- bash
- curl
- git
- jq
- vim
- neovim
- tmux
- node
- yq
- docker
- dive

## Ubuntu

```sh
sudo apt update
sudo apt install -y curl git jq vim tmux neovim

# Node
curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - 
sudo apt-get install nodejs

# yq
VERSION=v4.31.2
BINARY=yq_linux_amd64
curl -fsSL https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -o /usr/bin/yq && \
    chmod +x /usr/bin/yq

# Docker
sudo apt-get install ca-certificates curl gnupg lsb-release
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Dive
curl -fsSL https://github.com/wagoodman/dive/releases/download/v0.9.2/dive_0.9.2_linux_amd64.deb -o /tmp/dive.deb
sudo apt install /tmp/dive.deb
```

## Arch

```sh
yay -S bash curl jq vim neovim tmux nodejs npm go-yq docker docker-buildx \
    dive kubectl crictl kubeadm
```

## Mac

```sh
brew install bash curl git jq vim neovim tmux node@19 yq dive

# Docker desktop arm64
softwareupdate --install-rosetta
curl -fsSL https://desktop.docker.com/mac/main/arm64/Docker.dmg -o ~/Downloads/Docker.dmg --create-dirs
pushd ~/Downloads
sudo hdiutil attach Docker.dmg
sudo /Volumes/Docker/Docker.app/Contents/MacOS/install
sudo hdiutil detach /Volumes/Docker
popd
```

## Windows

Manually install everything:

- Git: [https://git-scm.com/downloads]
- jq: [https://stedolan.github.io/jq/]
- vim: [https://www.vim.org/download.php#pc]
- neovim: [https://github.com/neovim/neovim/releases/tag/stable]
- Windows terminal (instead of tmux):
  [Github release](https://github.com/microsoft/terminal/releases/latest) or
  [Store link](https://aka.ms/terminal)
- node: [https://nodejs.org/en/download/]
- Docker desktop: [https://docs.docker.com/desktop/install/windows-install/]
- Cygwin (bash and tmux won't work natively in windows): [https://cygwin.com/setup-x86_64.exe]

