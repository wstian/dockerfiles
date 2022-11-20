FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-runtime

USER root

WORKDIR /tmp

RUN apt-get update -y
# # fix opencv: libgthread-2.0.so.0: cannot open shared object file
RUN apt-get install git -y

RUN git clone --recursive https://github.com/pytorch/pytorch
RUN cd pytorch
# if you are updating an existing checkout
RUN git submodule sync
# RUN git submodule update --init --recursive --jobs 0
RUN cd /tmp/pytorch/android/libs/fbjni && git pull
RUN cd /tmp/pytorch/third_party/FP16 && git pull
RUN cd /tmp/pytorch/third_party/FXdiv && git pull
RUN cd /tmp/pytorch/third_party/NNPACK && git pull
