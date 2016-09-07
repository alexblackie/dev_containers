FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y "@C Development Tools and Libraries" golang golang-godoc golang-docs git

RUN useradd -m developer
RUN mkdir /gobin && chown developer /gobin

USER developer

RUN echo "cd /data" >> ~/.bashrc
RUN echo 'export PATH=/data/.gobin/bin:$PATH' >> ~/.bashrc

ENV GOPATH=/data/.gobin
VOLUME /data

ENTRYPOINT ["/bin/bash"]
