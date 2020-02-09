FROM ufoym/deepo:latest AS dl-stage

ENV SHELL=/bin/bash

RUN apt-get update && apt-get install -y \
        sudo \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install dependencies
RUN apt-get update && apt-get install -y \
    sudo \
    git \
    build-essential \
    apt-utils \
    ca-certificates \
    curl \
    software-properties-common \
    python3-dev \
    python3-pip \
    swig \
    wget \
    nano \
    vim \
    python-numpy \
    python-dev \
    python-opengl \
    cmake \
    zlib1g-dev \
    libjpeg-dev \
    xvfb \
    xorg-dev \
    libboost-all-dev \
    libsdl2-dev \
    libgtk2.0-dev \
    unzip \
    aptitude \
    pkg-config \
    qtbase5-dev \
    libqt5opengl5-dev \
    libassimp-dev \
    libpython3.5-dev \
    libboost-python-dev \
    libtinyxml-dev \
    screen \
    python-opencv \
    terminator \
    tmux \
    libcanberra-gtk-module \
    libfuse2 \
    libnss3 \
    fuse \
    python3-tk \
    libglfw3-dev \
    libgl1-mesa-dev \
    libgl1-mesa-glx \
    libglew-dev \
    libosmesa6-dev \
    net-tools \
    xpra \
    xserver-xorg-dev \
    libffi-dev \
    libxslt1.1 \
    libglew-dev \
    parallel \
    htop \
    apt-transport-https 

RUN pip3 install --upgrade pip

RUN pip3 --no-cache-dir install \
    plotly \
    ipykernel \
    jupyterlab 


ENV TERM xterm-256color

FROM codercom/code-server:latest AS vscode-stage

# install the necessary software
RUN sudo apt-get update \
    && sudo apt-get install -qy \
    build-essential \
    apt-utils \
    ca-certificates \
    curl \
    software-properties-common \
    python3-dev \
    python3-pip \
    cmake \
    screen \
    tmux \
    swig \
    wget \
    unzip 

# RUN sudo curl -sSL https://get.docker.com | sh \
#     && sudo apt-get install -y docker-compose \
#     && sudo apt-get -qy update \
#     && sudo apt-get -qy upgrade

# TensorBoard
EXPOSE 6006

# TCP port
EXPOSE 6767

# Jupyter
EXPOSE 8888

# vscode
EXPOSE 8443