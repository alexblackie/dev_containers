FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y erlang git make gcc gcc-c++ binutils glibc-devel patch
RUN curl -Lo /usr/local/bin/rebar3 https://s3.amazonaws.com/rebar3/rebar3 && \
	chmod +x /usr/local/bin/rebar3

RUN useradd -m developer

ADD dockerinit.sh /usr/local/bin/dockerinit.sh

VOLUME /data
CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/dockerinit.sh"]
