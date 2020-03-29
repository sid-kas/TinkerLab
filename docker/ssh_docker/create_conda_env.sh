#!/bin/bash

# set -o errexit
# set -o nounset
# set -o pipefail
source ~/.bashrc 
export PATH=~/miniconda/bin:$PATH 
conda init
source ~/.bashrc 
conda env create -f conda-cpu.yml
conda env create -f conda-gpu.yml

/usr/sbin/sshd -D