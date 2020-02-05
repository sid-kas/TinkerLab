FROM armhf/ubuntu:latest
# FROM arm32v7/debian:jessie-slim

# install the necessary software
RUN apt-get update \
    && apt-get install -qy \
    ca-certificates \
    curl \
    software-properties-common \
    python-software-properties \
    python3-dev \
    libatlas-base-dev \
    libzmq3-dev \
    python3-pip

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# install pip
RUN apt-get remove python3-pip -y
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN chmod 700 get-pip.py
RUN python3 get-pip.py


RUN mkdir -p /home/pi/husqvarna-automatic-drilling/
WORKDIR /home/pi/husqvarna-automatic-drilling/

   
RUN pip3 --no-cache-dir install --upgrade \
    pyzmq \
    numpy \
    python-dateutil 

RUN pip3 list

# test server
EXPOSE 5556

# zmq publish server
EXPOSE 4321

# data acquisition module
EXPOSE 5656

# material detection module
EXPOSE 6767

# automatic drill module
EXPOSE 7878