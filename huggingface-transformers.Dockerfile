ARG CUDA_DOCKER_VERSION=10.0-devel-ubuntu18.04
FROM nvidia/cuda:${CUDA_DOCKER_VERSION}

# Set default shell to /bin/bash
SHELL ["/bin/bash", "-cu"]

# Install essential packages.
RUN apt-get update -qq && apt-get install -y --allow-downgrades --allow-change-held-packages --no-install-recommends wget 

RUN mkdir /data
WORKDIR /data
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-base-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-large-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xxlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-base-cased-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-large-cased-pytorch_model.bin


