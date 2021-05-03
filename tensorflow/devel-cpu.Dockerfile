From tensorflow/tensorflow:latest-devel

WORKDIR /tensorflow_src

RUN ./configure
RUN bazel build --config=v1  //tensorflow/tools/pip_package:build_pip_package


