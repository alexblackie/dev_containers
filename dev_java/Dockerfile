FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y java-1.8.0-openjdk maven

RUN useradd -m developer
USER developer

RUN echo "cd /data" >> ~/.bashrc

RUN mkdir -p /home/developer/.m2
COPY settings.xml /home/developer/.m2/settings.xml

VOLUME /data

ENTRYPOINT ["/bin/bash"]
