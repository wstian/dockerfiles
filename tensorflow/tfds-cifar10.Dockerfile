From gcr.io/kubeflow-images-public/tensorflow-1.13.1-notebook-cpu:v0.5.0

RUN pip install tensorflow-datasets

WORKDIR /opt/tfds
COPY tfds-load.py ./

RUN tfds-load.py cifar10

