FROM ubuntu:18.04

# RUN git clone https://github.com/NVIDIA/apex.git && cd apex && python setup.py install --cuda_ext --cpp_ext
# RUN pip install transformers
# WORKDIR /workspace
RUN apt-get update && apt-get install -yq --no-install-recommends \
  apt-transport-https \
  build-essential \
  bzip2 \
  ca-certificates \
  curl \
  g++ \
  git \
  gnupg \
  graphviz \
  locales \
  lsb-release \
  openssh-client \
  sudo \
  unzip \
  vim \
  wget \
  zip \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*


RUN mkdir /data
WORKDIR /data
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-base-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-large-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xxlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-base-cased-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-large-cased-pytorch_model.bin


