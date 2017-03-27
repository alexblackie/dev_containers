FROM fedora:latest
MAINTAINER alex@alexblackie.com

ENV PATH $HOME/bin:$HOME/.gem_local/bin:$PATH
ENV GEM_HOME $HOME/.gem_local

ARG RUBY_MAJOR=2.3
ARG RUBY_MINOR=1

##
# Install tools and dependencies
##
RUN dnf install -y tar gcc gcc-c++ make binutils glibc-devel patch \
	zlib-devel libyaml-devel openssl-devel gdbm-devel readline-devel ncurses-devel libffi-devel curl-devel \
	nodejs libxslt-devel libxml2-devel postgresql-devel sqlite-devel mariadb-devel git file fontconfig bzip2 ImageMagick && \
	dnf clean all

##
# Install a Ruby by compiling from source
##

RUN curl -Lo /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_MAJOR.$RUBY_MINOR.tar.gz
RUN tar -zxf /tmp/ruby.tar.gz -C /tmp/ && cd /tmp/ruby-$RUBY_MAJOR.$RUBY_MINOR && \
	./configure && make && make install && \
	rm -rf /tmp/ruby-$RUBY_MAJOR.$RUBY_MINOR /tmp/ruby.tar.gz

##
# Install PhantomJS for feature test suites
##
RUN curl -Lo /tmp/phantomjs.tar.bz2 https://assets.alexblackie.com/mirror/phantomjs/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
	tar -xjf /tmp/phantomjs.tar.bz2 -C /tmp && \
	mv /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs && \
	rm -fr /tmp/phantomjs.tar.bz2 /tmp/phantomjs-2.1.1-linux-x86_64

##
# Set up development environment configuration
##

# Add unprivileged user to run as
RUN useradd -m developer
USER developer

# Speed up gem installs by disabling ri and rdoc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Add bundler config to use `/data/vendor/bundle` as the gem install path
RUN mkdir ~/.bundle && \
	echo -e "BUNDLE_DISABLE_LOCAL_BRANCH_CHECK: 'true'\nBUNDLE_PATH: vendor/bundle\nBUNDLE_DISABLE_SHARED_GEMS: 'true'\n" > ~/.bundle/config
RUN gem install bundler

# Switch back to root for initialisation
# we `su` to developer manually
USER root

##
# General container settings
##

ADD dockerinit.sh /usr/local/bin/dockerinit.sh

VOLUME /data

CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/dockerinit.sh"]
