FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y java-1.8.0-openjdk maven

RUN useradd -m developer
USER developer

RUN echo "cd /data" >> ~/.bashrc

VOLUME /data
VOLUME /home/developer/.m2

ENTRYPOINT ["/bin/bash"]
