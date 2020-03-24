# FROM python:3.5
FROM debian:jessie
FROM tensorflow/tensorflow:latest-py3

RUN apt-get update && apt-get install -y \
        sudo \
        git \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# # For python3
# RUN apt-get install python3-numpy python3-dev python3-pip

# RUN git clone https://CIT-sidkas:Sidkas_292@bitbucket.org/citdigitalization/husqvarna-automatic-drilling.git

RUN pip --no-cache-dir install \
    pyzmq \
    numpy \
    scipy 

WORKDIR /home/pi/husqvarna-automatic-drilling/

EXPOSE 5556

# zmq publish server
EXPOSE 4321

# data acquisition module
EXPOSE 5656

# material detection module
EXPOSE 6767

# automatic drill module
EXPOSE 7878