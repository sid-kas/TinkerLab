FROM codercom/code-server:latest

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

RUN sudo curl -sSL https://get.docker.com | sh \
    && sudo apt-get install -y docker-compose \
    && sudo apt-get -qy update \
    && sudo apt-get -qy upgrade


# RUN pip3 --no-cache-dir install \
#     pyzmq \
#     numpy \
#     scipy \
#     tensorflow \
#     python-dateutil \
#     flatbuffers

# TensorBoard
EXPOSE 6006

# TCP port
EXPOSE 6767

# Jupyter
EXPOSE 8888

# vscode
EXPOSE 8443

