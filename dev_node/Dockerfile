FROM node:6

RUN useradd -m developer
USER developer

# In Fedora, the .bashrc doesn't exit immediately if non-interactive.
# In Debian, we need to do this fucking dance just to get shit to run
RUN echo "export PATH=/home/developer/.elixir/bin:\$PATH\ncd /data" >> ~/bashrc-patch && \
	mv ~/.bashrc ~/.bashrc-orig && \
	cat ~/bashrc-patch ~/.bashrc-orig > ~/.bashrc && \
	rm ~/.bashrc-orig ~/bashrc-patch

VOLUME /data

ENTRYPOINT ["/bin/bash"]
