#!/bin/sh

USER_UID=$(id -u)
USER_GID=$(id -g)
name="seabirds_bash"
docker rm "$name"
nvidia-docker run \
	-it \
	--init \
    --runtime=nvidia \
	--volume=/home/:/home/:rw \
	--volume=/media/:/media/:rw \
	--env="USER_UID=${USER_UID}" \
	--env="USER_GID=${USER_GID}" \
	--env="USER=${USER}" \
	--env="HOME=${HOME}" \
	-p 5005:6006 \
	-p 9889:8888 \
	--cap-add SYS_ADMIN \
	--cap-add MKNOD \
	--device /dev/fuse \
	--security-opt apparmor:unconfined \
	--name "$name" \
    seabirds_group12:latest bash
