FROM pytorch/pytorch:latest

# RUN git clone https://github.com/NVIDIA/apex.git && cd apex && python setup.py install --cuda_ext --cpp_ext
# RUN pip install transformers
# WORKDIR /workspace
RUN mkdir /data
WORKDIR /data
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/albert-base-v2-pytorch_model.bin -O albert-base-v2-pytorch_model.bin
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/albert-large-v2-pytorch_model.bin -O albert-large-v2-pytorch_model.bin
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/albert-xlarge-v2-pytorch_model.bin -O albert-xlarge-v2-pytorch_model.bin
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/albert-xxlarge-v2-pytorch_model.bin -O albert-xxlarge-v2-pytorch_model.bin
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-base-cased-pytorch_model.bin -O xlnet-base-cased-pytorch_model.bin
RUN curl https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-large-cased-pytorch_model.bin -O xlnet-large-cased-pytorch_model.bin


