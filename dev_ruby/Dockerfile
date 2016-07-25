FROM fedora:latest
MAINTAINER alex@alexblackie.com

RUN dnf install -y "@C Development Tools and Libraries" \
	zlib-devel libyaml-devel openssl-devel gdbm-devel readline-devel ncurses-devel libffi-devel \
	nodejs \
	postgresql-devel sqlite-devel mariadb-devel \
	git

RUN curl -Lo /tmp/ruby.tar.gz https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.1.tar.gz
RUN tar -zxf /tmp/ruby.tar.gz -C /tmp/ && cd /tmp/ruby-2.3.1 && \
	./configure && make && make install && rm -rf /tmp/ruby /tmp/ruby.tar.gz

RUN useradd -m developer
RUN chown -R developer /usr/local/lib/ruby
USER developer

RUN mkdir ~/.gem_local && echo 'export GEM_HOME="$HOME/.gem_local"' >> ~/.bashrc
RUN echo 'export PATH="$HOME/.gem_local/bin:$PATH"' >> ~/.bashrc

RUN echo "cd /data" >> ~/.bashrc
RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN mkdir ~/.bundle && echo -e "BUNDLE_DISABLE_LOCAL_BRANCH_CHECK: 'true'\nBUNDLE_PATH: vendor/bundle\nBUNDLE_DISABLE_SHARED_GEMS: 'true'\n" > ~/.bundle/config

RUN /bin/bash -lc "gem install bundler"

VOLUME /data

ENTRYPOINT ["/bin/bash"]
