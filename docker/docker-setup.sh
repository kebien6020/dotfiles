#!/bin/sh

# ssh-agent permissions
[ -S /ssh-agent ] && sudo chown kevin:kevin /ssh-agent

# docker permissions
DOCKER_SOCKET=/var/run/docker.sock
DOCKER_GROUP=docker
USER=kevin
if [ -S ${DOCKER_SOCKET} ]; then
	DOCKER_GID=$(stat -c '%g' ${DOCKER_SOCKET})
	sudo addgroup --gid ${DOCKER_GID} ${DOCKER_GROUP}
	sudo usermod --append --groups ${DOCKER_GROUP} ${USER}
fi

# volume permissions
sudo chown -R kevin:kevin /home/kevin/projects

# start vim once
vim
