FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y "@C Development Tools and Libraries" git python3 python3-pip python3-devel redhat-rpm-config && \
	dnf clean all

# dammit fedora just upgrade your shit already
RUN ln -s /usr/bin/pip3 /usr/bin/pip && \
	ln -s /usr/bin/python3 /usr/bin/python

RUN pip install --upgrade pip

RUN useradd -m developer
USER developer

RUN mkdir /home/developer/.pip && \
	echo -e "[global]\ntarget=/data/.pip_cache" > /home/developer/.pip/pip.conf

RUN echo "cd /data" >> /home/developer/.bashrc

VOLUME /data

ENTRYPOINT ["/bin/bash"]
