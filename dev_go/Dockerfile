FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y "@C Development Tools and Libraries" golang golang-godoc golang-docs git

RUN useradd -m developer
USER developer

RUN echo "cd /data" >> ~/.bashrc
RUN echo 'export PATH=/data/bin:$PATH' >> ~/.bashrc

ENV GOPATH=/data
VOLUME /data

ENTRYPOINT ["/bin/bash"]
