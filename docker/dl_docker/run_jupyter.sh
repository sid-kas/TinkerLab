#!/bin/sh

USER_UID=$(id -u)
USER_GID=$(id -g)
name="dl_notebook"
docker rm "$name"
docker run \
	-it \
	--init \
    --gpus all \
	--volume=${HOME}:/home/:rw \
	--volume=/media/:/media/:rw \
	--env="USER_UID=${USER_UID}" \
	--env="USER_GID=${USER_GID}" \
	--env="USER=${USER}" \
	--env="HOME=${HOME}" \
	-p 9687:8888 \
	--cap-add SYS_ADMIN \
	--cap-add MKNOD \
	--device /dev/fuse \
	--security-opt apparmor:unconfined \
	--name "$name" \
    sidkas/dl_gpu:latest jupyter notebook --no-browser --ip=0.0.0.0 --allow-root --NotebookApp.token= --notebook-dir='/home/'
