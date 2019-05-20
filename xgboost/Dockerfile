From ubuntu:16.04

RUN apt-get update -y && \
    apt-get install -y apt-utils  build-essential curl \
    vim g++ curl wget git \
    python-dev python-setuptools python3-pip \
    libssl-dev libffi-dev python3-bcrypt \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt
# download binary-executable cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.4/cmake-3.14.4-Linux-x86_64.tar.gz -O cmake.tar.gz\
    && tar xf cmake.tar.gz

# download xgboost source code
RUN git clone --recursive https://github.com/dmlc/xgboost

# make and install
WORKDIR xgboost/build
RUN git checkout release_0.81 && /opt/cmake-3.14.4-Linux-x86_64/bin/cmake .. && make -j4 && make install  && cp ../xgboost /usr/local/bin

WORKDIR /opt/xgboost/python-package
RUN pip3 --no-cache-dir install numpy scipy \
    && python3 setup.py install

RUN pip3 --no-cache-dir install scikit-learn \
    kubernetes \
    pyyaml
