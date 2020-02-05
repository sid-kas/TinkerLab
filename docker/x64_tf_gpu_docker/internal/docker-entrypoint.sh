#!/bin/bash

# Add local user
# Either use the USER_UID if passed in at runtime or
# fallback
USER_ID=${USER_UID:-9001}

export HOME=$DOCKER_HOME

sudo chmod -R 777 $DOCKER_HOME

cd $DOCKER_HOME
touch .bashrc

echo "Starting with UID: $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m $USER

echo "export USER=$USER" > "$DOCKER_HOME/.bashrc"
echo "export HOME=$DOCKER_HOME" >> "$DOCKER_HOME/.bashrc"

echo "export \$(dbus-launch)" >> "$DOCKER_HOME/.bashrc"
echo "export LD_LIBRARY_PATH=/external_libs:\$LD_LIBRARY_PATH" >> "$DOCKER_HOME/.bashrc"
# echo "export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libGLEW.so:/external_libs/libGL*" >> "$DOCKER_HOME/.bashrc"

# # echo "export PYTHONPATH=/opt/rllab:$PYTHONPATH" >> "/home/$USER/.bashrc"
# # export PYTHONPATH=/opt/rllab:$PYTHONPATH
# echo "export PYTHONPATH=/opt/rllab" >> "/home/$USER/.bashrc"
# echo "export PATH=/usr/local/cuda/bin:/opt/conda/bin:\$PATH" >> "/home/$USER/.bashrc"

# source "/home/$USER/.bashrc"

echo "
jupyter_notebook() {
	jupyter notebook --allow-root --ip=* --port=8888 --no-browser &
}

jupyter_lab() {
	jupyter lab --allow-root --ip=* --port=8888 --no-browser &
}

parallelize() {
	THREADS=\${2:-8}
	echo \"Running \$THREADS threads of \$1\"
	MASTER_TIME=\$(date +\"%Y-%m-%d-%H-%M-%S\")
	echo \"Starting master at \" \$(date)
	time parallel --no-notice --delay 5 \$3 CUDA_VISIBLE_DEVICES='' \$1 --seed {1} --master \$MASTER_TIME ::: \$(seq \$THREADS)
}
" >> $DOCKER_HOME/.bashrc

exec /usr/local/bin/gosu $USER bash --rcfile $DOCKER_HOME/.bashrc
