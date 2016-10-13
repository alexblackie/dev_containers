FROM centos:latest

RUN rpm --import https://dist.crystal-lang.org/rpm/RPM-GPG-KEY
ADD crystal.repo /etc/yum.repos.d/crystal.repo

RUN yum install -y crystal

RUN useradd -m developer
USER developer

RUN echo "cd /data" >> ~/.bashrc

VOLUME /data
ENTRYPOINT ["/bin/bash"]
