FROM horovod/horovod:0.18.2-tf2.0.0-torch1.3.0-mxnet1.5.0-py3.6-gpu

ENV USE_BYTESCHEDULER=1
ENV BYTESCHEDULER_WITH_MXNET=1
ENV BYTESCHEDULER_WITHOUT_PYTORCH=1
ENV MXNET_ROOT=/root/incubator-mxnet

WORKDIR /root/

# Clone MXNet as ByteScheduler compilation requires header files
RUN git clone --recursive --branch v1.5.x https://github.com/apache/incubator-mxnet.git

# Install ByteScheduler
RUN pip install bayesian-optimization
RUN git clone --branch bytescheduler --recursive https://github.com/bytedance/byteps.git && \
    cd byteps/bytescheduler && python setup.py install

# Examples
WORKDIR /root/byteps/bytescheduler/examples/mxnet-image-classification
