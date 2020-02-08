FROM ufoym/deepo:all-jupyter-cpu AS builder

RUN apt-get update && apt-get install -y \
        sudo \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
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
    git \
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
    apt-transport-https \
    tmux 

# RUN sudo curl -sSL https://get.docker.com | sh \
#     && sudo apt-get install -y docker-compose \
#     && sudo apt-get -qy update \
#     && sudo apt-get -qy upgrade


FROM codercom/code-server:latest 


# TensorBoard
EXPOSE 6006

# TCP port
EXPOSE 6767

# Jupyter
EXPOSE 8888

# vscode
EXPOSE 8443