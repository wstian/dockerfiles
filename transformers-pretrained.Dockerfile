From ubuntu:18.04 

RUN apt-get update
RUN apt-get install wget -y

WORKDIR /pretrained

RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/bert-large-uncased-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/bert-base-uncased-pytorch_model.bin
RUN wget https://s3.amazonaws.com/models.huggingface.co/bert/albert-xxlarge-v2-pytorch_model.bin
