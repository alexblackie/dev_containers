FROM fedora:latest
MAINTAINER alex@alexblackie.com

##
# Install a Ruby by compiling from source
##
RUN dnf install -y "@C Development Tools and Libraries" patch \
	zlib-devel libyaml-devel openssl-devel gdbm-devel readline-devel ncurses-devel libffi-devel curl-devel

RUN curl -Lo /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz
RUN tar -zxf /tmp/ruby.tar.gz -C /tmp/ && cd /tmp/ruby-2.3.1 && \
	./configure && make && make install && rm -rf /tmp/ruby /tmp/ruby.tar.gz

##
# Install common required packages or headers not required to compile Ruby
##
RUN dnf install -y nodejs libxslt-devel libxml2-devel postgresql-devel sqlite-devel mariadb-devel git file fontconfig bzip2 ImageMagick

##
# Set up development environment configuration
##

# Add unprivileged user to run as
RUN useradd -m developer
USER developer

# Add `/home/developer/.gem_local` for sudo-less global gem installs. Note:
# this will be wiped once the container quits.
RUN mkdir ~/.gem_local && echo 'export GEM_HOME="$HOME/.gem_local"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/bin:$HOME/.gem_local/bin:$PATH"' >> ~/.bashrc

# Automatically enter the mounted application root
RUN echo "cd /data" >> ~/.bashrc

# Speed up gem installs by disabling ri and rdoc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc

# Add bundler config to use `/data/vendor/bundle` as the gem install path
RUN mkdir ~/.bundle && echo -e "BUNDLE_DISABLE_LOCAL_BRANCH_CHECK: 'true'\nBUNDLE_PATH: vendor/bundle\nBUNDLE_DISABLE_SHARED_GEMS: 'true'\n" > ~/.bundle/config

RUN /bin/bash -lc "gem install bundler"

##
# Install PhantomJS for feature test suites
RUN mkdir /home/developer/bin && \
	curl -Lo /tmp/phantomjs.tar.bz2 https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 && \
	tar -xjf /tmp/phantomjs.tar.bz2 -C /tmp && \
	mv /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /home/developer/bin/phantomjs

##
# General container settings
##

VOLUME /data
ENTRYPOINT ["/bin/bash"]
