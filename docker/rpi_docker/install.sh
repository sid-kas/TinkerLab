#!/bin/bash
set -e

apt-get update && apt-get install -y \
        sudo \
        git \
        && \
apt-get clean && \
rm -rf /var/lib/apt/lists/*
apt-get -qy upgrade

apt-get -qy install python3-dev python3-pip
apt-get -qy install libatlas-base-dev libzmq3-dev    
pip3 install -U virtualenv 

virtualenv --system-site-packages -p python3 ./py3
echo "setting virtual env name py3"
echo "use: 'source ./py3/bin/activate' to activate"
source ./py3/bin/activate

pip install --upgrade pip
pip install --user --no-cache-dir --upgrade pyzmq numpy scipy tensorflow
pip list 

python -c "import tensorflow as tf;print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

deactivate

