FROM ubuntu:18.04

RUN apt-get update && apt-get install -yq --no-install-recommends \
  apt-transport-https \
  build-essential \
  bzip2 \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  openssh-client \
  sudo \
  unzip \
  vim \
  wget \
  zip \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /data
RUN wget https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.12.0-cp36-cp36m-linux_x86_64.whl
RUN wget https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-1.12.0-cp27-none-linux_x86_64.whl
RUN wget https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.12.0-cp36-cp36m-linux_x86_64.whl
RUN wget https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow_gpu-1.12.0-cp27-none-linux_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/77/63/a9fa76de8dffe7455304c4ed635be4aa9c0bacef6e0633d87d5f54530c5c/tensorflow-1.13.1-cp36-cp36m-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/d2/ea/ab2c8c0e81bd051cc1180b104c75a865ab0fc66c89be992c4b20bbf6d624/tensorflow-1.13.1-cp27-cp27mu-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/7b/b1/0ad4ae02e17ddd62109cd54c291e311c4b5fd09b4d0678d3d6ce4159b0f0/tensorflow_gpu-1.13.1-cp36-cp36m-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/24/8c/459eb5fdaa8666010b6a32244ddb92f4015cfc54156d612959625096601d/tensorflow_gpu-1.13.1-cp27-cp27mu-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/29/39/f99185d39131b8333afcfe1dcdb0629c2ffc4ecfb0e4c14ca210d620e56c/tensorflow-2.0.0a0-cp36-cp36m-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/bc/84/970bfb6eb04360a675627a38962127f0f5302ac1fd3ac4ad4f5d1befc9b7/tensorflow-2.0.0a0-cp27-cp27mu-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/1a/66/32cffad095253219d53f6b6c2a436637bbe45ac4e7be0244557210dc3918/tensorflow_gpu-2.0.0a0-cp36-cp36m-manylinux1_x86_64.whl
RUN wget https://files.pythonhosted.org/packages/55/18/48ea6802a165fc4c24216768ad497af287f18db5bf91597b85f8903e70dc/tensorflow_gpu-2.0.0a0-cp27-cp27mu-manylinux1_x86_64.whl
