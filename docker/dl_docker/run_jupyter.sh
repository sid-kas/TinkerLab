#!/bin/sh

USER_UID=$(id -u)
USER_GID=$(id -g)
name="seabirds_notebook"
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
	-p 9876:8888 \
	--cap-add SYS_ADMIN \
	--cap-add MKNOD \
	--device /dev/fuse \
	--security-opt apparmor:unconfined \
	--name "$name" \
    seabirds_group12:latest jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home'
