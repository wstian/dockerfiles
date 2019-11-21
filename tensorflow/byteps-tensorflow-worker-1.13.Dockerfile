# Copyright 2019 Bytedance Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================
FROM tensorflow/tensorflow:1.13.2-gpu-py3

ENV BYTEPS_BASE_PATH /usr/local
ENV BYTEPS_PATH $BYTEPS_BASE_PATH/byteps
ENV BYTEPS_GIT_LINK https://github.com/bytedance/byteps

RUN apt-get update &&\
    apt-get install -y --allow-unauthenticated --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
        ca-certificates \
        git \
        curl \
        wget \
        vim \
        liblapack-dev \
        libopencv-dev \
        libjemalloc-dev \
        graphviz \
        cmake \
        libjpeg-dev \
        libpng-dev \
        iftop \
        lsb-release \
        gcc-4.9 \
        g++-4.9 \
        gcc-4.9-base

RUN pip --no-cache-dir install \
        matplotlib \
        numpy==1.15.2 \
        scipy \
        sklearn \
        pandas \
        graphviz==0.9.0

WORKDIR /root/

RUN cd $BYTEPS_BASE_PATH &&\
    git clone --recurse-submodules $BYTEPS_GIT_LINK

# Pin GCC to 4.9 (priority 200) to compile correctly against TensorFlow, PyTorch, and MXNet.
RUN update-alternatives --install /usr/bin/gcc gcc $(readlink -f $(which gcc)) 100 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc $(readlink -f $(which gcc)) 100 && \
    update-alternatives --install /usr/bin/g++ g++ $(readlink -f $(which g++)) 100 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ $(readlink -f $(which g++)) 100
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 200 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-gcc x86_64-linux-gnu-gcc /usr/bin/gcc-4.9 200 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 200 && \
    update-alternatives --install /usr/bin/x86_64-linux-gnu-g++ x86_64-linux-gnu-g++ /usr/bin/g++-4.9 200

# # Install BytePS
# ARG BYTEPS_NCCL_LINK=shared
# RUN cd $BYTEPS_PATH &&\
#     BYTEPS_WITHOUT_PYTORCH=1 python setup.py install &&\
#     BYTEPS_WITHOUT_PYTORCH=1 python setup.py bdist_wheel

# # Remove GCC pinning
# RUN update-alternatives --remove gcc /usr/bin/gcc-4.9 && \
#     update-alternatives --remove x86_64-linux-gnu-gcc /usr/bin/gcc-4.9 && \
#     update-alternatives --remove g++ /usr/bin/g++-4.9 && \
#     update-alternatives --remove x86_64-linux-gnu-g++ /usr/bin/g++-4.9
# 
# RUN rm -rf /usr/local/cuda/lib64/libcuda.so && \
#     rm -rf /usr/local/cuda/lib64/libcuda.so.1
