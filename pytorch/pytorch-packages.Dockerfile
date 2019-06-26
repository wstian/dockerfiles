From gcr.io/kubeflow-images-public/tensorflow-1.13.1-notebook-cpu:v0.5.0 as builder

WORKDIR /opt/pip-packages

USER root
RUN pip download torch torchvision

FROM ubuntu:18.04

WORKDIR /opt

COPY --from=builder /opt/pip-packages ./
