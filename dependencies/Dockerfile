FROM ubuntu:16.04
MAINTAINER "ArthurWuTw <lion811004@gmail.com>"

ARG CONTAINER_USER
ARG HOST_USER_GID
ARG HOST_USER_UID
ARG TIMEZONE

WORKDIR /tmp

# Disable interactive configuration
ENV DEBIAN_FRONTEND=noninteractive

# Setup the host's timezone
RUN apt-get update && \
  ln -sf /usr/share/zoneinfo${TIMEZONE:?} /etc/localtime && \
  apt-get install -y tzdata

# Create user
COPY create-user utils.sh ./
RUN ./create-user && \
  rm create-user utils.sh

# Install host's certification
RUN apt-get update && \
  apt-get install -y ca-certificates && \
  update-ca-certificates

# Install apt-getable dependencies
RUN apt-get update \
    && apt-get install -y \
        build-essential \
        cmake \
        python \
        git \
        curl \
        openssh-server \
        git-core \
        net-tools \
        vim \
        gcc

# Install locust, it needs Python3.6
RUN apt-get update \
    && apt-get install -y \
    build-essential \
    software-properties-common \
    wget \
    iputils-ping \
    net-tools \
    vim \
    htop \
    curl


RUN sudo add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y \
        python \
        python-pip \
        python3 \
        python3-pip \
        python3.6 \
        python3.6-dev

RUN sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 1
RUN sudo update-alternatives --config python3
RUN sudo pip3 install --upgrade pip==20.0.2
RUN pip3 install locust


COPY enter-container-shell \
    infinite-loop \
    /usr/local/bin/
RUN chmod +x /usr/local/bin/infinite-loop
RUN chmod +x /usr/local/bin/enter-container-shell

