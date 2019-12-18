FROM nvidia/cuda:10.0-devel-ubuntu18.04

# TensorFlow version is tightly coupled to CUDA and cuDNN so it should be selected carefully
ENV TENSORFLOW_VERSION=1.14.0
ENV PYTORCH_VERSION=1.3.0
ENV TORCHVISION_VERSION=0.4.1
ENV CUDNN_VERSION=7.6.0.64-1+cuda10.0
ENV NCCL_VERSION=2.4.8-1+cuda10.0
ENV MXNET_VERSION=1.5.0

# Python 2.7 or 3.6 is supported by Ubuntu Bionic out of the box
ARG python=3.6
ENV PYTHON_VERSION=${python}

# Set default shell to /bin/bash
SHELL ["/bin/bash", "-cu"]

RUN apt-get update && apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends \
        build-essential \
        cmake \
        g++-4.8 \
        git \
        curl \
        vim \
        wget \
        ca-certificates \
        libcudnn7=${CUDNN_VERSION} \
        libnccl2=${NCCL_VERSION} \
        libnccl-dev=${NCCL_VERSION} \
        libjpeg-dev \
        libpng-dev \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-dev \
        librdmacm1 \
        libibverbs1 \
        ibverbs-providers

RUN if [[ "${PYTHON_VERSION}" == "3.6" ]]; then \
        apt-get install -y python${PYTHON_VERSION}-distutils; \
    fi
RUN ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

# Install TensorFlow, Keras, PyTorch and MXNet
RUN pip install future typing
RUN pip install numpy \
        tensorflow-gpu==${TENSORFLOW_VERSION} \
        keras \
        h5py

RUN pip install https://download.pytorch.org/whl/cu100/torch-${PYTORCH_VERSION}%2Bcu100-$(python -c "import wheel.pep425tags as w; print('-'.join(w.get_supported()[0][:-1]))")-linux_x86_64.whl \
        https://download.pytorch.org/whl/cu100/torchvision-${TORCHVISION_VERSION}%2Bcu100-$(python -c "import wheel.pep425tags as w; print('-'.join(w.get_supported()[0][:-1]))")-linux_x86_64.whl
RUN pip install mxnet-cu100==${MXNET_VERSION}
