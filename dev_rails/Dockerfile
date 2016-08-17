FROM alexblackie/dev_ruby:latest

USER root
RUN dnf install -y fontconfig bzip2 ImageMagick

USER developer
RUN mkdir /home/developer/bin && \
	curl -Lo /tmp/phantomjs.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
	tar -xjf /tmp/phantomjs.tar.bz2 -C /tmp && \
	mv /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /home/developer/bin/phantomjs
