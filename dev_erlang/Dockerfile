FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y erlang git
RUN curl -Lo /usr/local/bin/rebar3 https://s3.amazonaws.com/rebar3/rebar3 && \
	chmod +x /usr/local/bin/rebar3

RUN useradd -m developer
USER developer

RUN echo "cd /data" >> ~/.bashrc

VOLUME /data

ENTRYPOINT ["/bin/bash"]
