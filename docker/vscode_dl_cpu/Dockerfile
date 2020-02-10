FROM codercom/code-server:latest

ENV SHELL=/bin/bash
ENV LANG C.UTF-8

    
RUN APT_INSTALL="sudo apt-get install -y --no-install-recommends" && \
    PIP_INSTALL="sudo python -m pip --no-cache-dir install --upgrade" && \
    GIT_CLONE="sudo git clone --depth 10" && \
    sudo apt-get update -y

## Tools
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends  \
        build-essential \
        apt-utils \
        ca-certificates \
        curl \
        swig \
        wget \
        nano \
        vim \
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
        libtinyxml-dev \
        screen \
        terminator \
        tmux \
        libcanberra-gtk-module \
        libfuse2 \
        libnss3 \
        fuse \
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
        libatlas-base-dev \
        protobuf-compiler \
        libprotoc-dev \
        graphviz \
        parallel \
        htop \
        apt-transport-https \
        libssl-dev \
        unrar \
        && \
    sudo git clone --depth 10 https://github.com/Kitware/CMake ~/cmake && \
    cd ~/cmake && \
    ./bootstrap && \
    make -j"$(nproc)" install

## Python 
RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    software-properties-common \
    && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        python3.6 \
        python3.6-dev \
        python3-distutils-extra \
        && \
    wget -O ~/get-pip.py \
        https://bootstrap.pypa.io/get-pip.py && \
    python3.6 ~/get-pip.py && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python3 && \
    ln -s /usr/bin/python3.6 /usr/local/bin/python && \
    sudo python -m pip --no-cache-dir install --upgrade \
        setuptools \
        && \
    sudo python -m pip --no-cache-dir install --upgrade \
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
RUN sudo python -m pip --no-cache-dir install --upgrade \
        future \
        numpy \
        protobuf \
        enum34 \
        pyyaml \
        typing \
        && \
    sudo python -m pip --no-cache-dir install --upgrade \
        --pre torch torchvision -f \
        https://download.pytorch.org/whl/nightly/cpu/torch_nightly.html 


# opencv

RUN sudo DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libatlas-base-dev \
        libgflags-dev \
        libgoogle-glog-dev \
        libhdf5-serial-dev \
        libleveldb-dev \
        liblmdb-dev \
        libprotobuf-dev \
        libsnappy-dev \
        protobuf-compiler \
        && \
    sudo git clone --depth 10 --branch 4.1.2 https://github.com/opencv/opencv ~/opencv && \
    mkdir -p ~/opencv/build && cd ~/opencv/build && \
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
          -D CMAKE_INSTALL_PREFIX=/usr/local \
          -D WITH_IPP=OFF \
          -D WITH_CUDA=OFF \
          -D WITH_OPENCL=OFF \
          -D BUILD_TESTS=OFF \
          -D BUILD_PERF_TESTS=OFF \
          -D BUILD_DOCS=OFF \
          -D BUILD_EXAMPLES=OFF \
          .. && \
    make -j"$(nproc)" install && \
    ln -s /usr/local/include/opencv4/opencv2 /usr/local/include/opencv2 

# Install docker and docker-compose
RUN sudo curl -sSL https://get.docker.com | sh \
    && sudo apt-get install -y docker-compose \
    && sudo apt-get -qy update

# config & cleanup
RUN ldconfig && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* ~/*

# TensorBoard
EXPOSE 6006

# TCP port
EXPOSE 6767

# Jupyter
EXPOSE 8888

# vscode
EXPOSE 8443

