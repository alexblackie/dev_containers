# Golang Development Container

Because of how Go works, using this container is a bit more cumbersome than
others. The container's `/data` will be your GOPATH, so you'll need to put all
your dependencies and projects files in a hierarchy under that. Therefore,
you'll likely want to always spawn a shell instead of running one-off commands.
