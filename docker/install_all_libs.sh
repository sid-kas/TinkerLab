#!/bin/bash
if [ `id -u` -ne 0 ]; then
    echo "*** This script can be executed only as root***"
    echo "*** Exiting... ***"
    exit 1
fi
set -e
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
CWD="$PWD"


# DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  \
#         build-essential \
#         apt-utils \
#         ca-certificates \
#         curl \
#         swig \
#         wget \
#         nano \
#         vim \
#         cmake \
#         zlib1g-dev \
#         libjpeg-dev \
#         xvfb \
#         xorg-dev \
#         libboost-all-dev \
#         libsdl2-dev \
#         libgtk2.0-dev \
#         unzip \
#         aptitude \
#         pkg-config \
#         qtbase5-dev \
#         libqt5opengl5-dev \
#         libassimp-dev \
#         libtinyxml-dev \
#         screen \
#         terminator \
#         tmux \
#         libcanberra-gtk-module \
#         libfuse2 \
#         libnss3 \
#         fuse \
#         libglfw3-dev \
#         libgl1-mesa-dev \
#         libgl1-mesa-glx \
#         libglew-dev \
#         libosmesa6-dev \
#         net-tools \
#         xpra \
#         xserver-xorg-dev \
#         libffi-dev \
#         libxslt1.1 \
#         libglew-dev \
#         libatlas-base-dev \
#         protobuf-compiler \
#         libprotoc-dev \
#         graphviz \
#         parallel \
#         htop \
#         apt-transport-https \
#         libssl-dev \
#         unrar 


## Python 
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
software-properties-common && \
apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3 \
    python3-dev \
    python3-distutils-extra \
    && \
wget -O ~/get-pip.py \
    https://bootstrap.pypa.io/get-pip.py && \
python3 ~/get-pip.py && \
ln -s /usr/bin/python3 /usr/local/bin/python3 && \
ln -s /usr/bin/python3 /usr/local/bin/python 

python -m pip --no-cache-dir install --upgrade \
    setuptools \
    && \
python -m pip --no-cache-dir install --upgrade \
    numpy \
    pyzmq \
    scipy \
    pandas \
    cloudpickle \
    scikit-image>=0.14.2 \
    scikit-learn \
    matplotlib \
    Cython \
    tqdm \
    plotly \
    jupyter \
    ipykernel \
    jupyterlab \
    tensorflow \
    h5py \
    keras 

# pytorch
python -m pip --no-cache-dir install --upgrade \
    future \
    numpy \
    protobuf \
    enum34 \
    pyyaml \
    typing \
    && \
python -m pip --no-cache-dir install --upgrade \
    --pre torch torchvision -f \
    https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html 


    

# config & cleanup
apt-get clean && \
apt-get autoremove 