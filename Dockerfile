FROM ubuntu:22.04

# Here, we are going to set the frontend to no interactive.
ENV DEBIAN_FRONTEND=noninteractive

# Here we are going to run and update and upgrade packages.
RUN apt-get update -y
RUN apt-get upgrade -y

# Here, we are going to add some basic requirements
RUN apt-get install --no-install-recommends \
    build-essential \
    ca-certificates \
    curl \
    dkms \
    gnupg \
    less \
    nano \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    software-properties-common \
    supervisor \
    sudo \
    unzip \
    wget \
    zip \
    -y

# Here, we are going to add docker user.
RUN useradd --uid 1000 --home-dir /home/docker --create-home docker && \
    echo 'docker ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/docker && \
    chmod 440 /etc/sudoers.d/docker

USER docker

WORKDIR /home/docker