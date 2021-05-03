From tensorflow/tensorflow:latest-devel-gpu

WORKDIR /tensorflow_src

RUN bazel test //tensorflow/core
