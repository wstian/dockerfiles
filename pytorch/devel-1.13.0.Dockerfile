FROM pytorch/pytorch:1.13.0-cuda11.6-cudnn8-devel

USER root

WORKDIR /tmp

RUN apt-get update -y
# # fix opencv: libgthread-2.0.so.0: cannot open shared object file
RUN apt-get install git -y

RUN git clone --recursive https://github.com/pytorch/pytorch
RUN cd pytorch
# if you are updating an existing checkout
RUN git submodule sync
RUN git submodule update --init --recursive --jobs 0
