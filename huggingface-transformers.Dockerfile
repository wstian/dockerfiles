FROM pytorch/pytorch:latest

# RUN git clone https://github.com/NVIDIA/apex.git && cd apex && python setup.py install --cuda_ext --cpp_ext
# RUN pip install transformers
# WORKDIR /workspace
RUN mkdir /data
WORKDIR /data
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-base-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-large-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xxlarge-v2-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-base-cased-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/xlnet-large-cased-pytorch_model.bin


