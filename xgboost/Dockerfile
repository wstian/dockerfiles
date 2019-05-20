From ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y apt-utils  build-essential curl \
    g++ wget git \
    python-dev python-setuptools python3-pip \
    libssl-dev libffi-dev python3-bcrypt \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.tar.gz -O cmake.tar.gz\
    && tar xf cmake.tar.gz
cd cmake-3.14.4-Linux-x86_64
RUN git clone --recursive https://github.com/dmlc/xgboost
WORKDIR xgboost/build
RUN git checkout v0.82 && cmake .. && make -j4


