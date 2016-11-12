# Development Containers

[![No Maintenance Intended](http://unmaintained.tech/badge.svg)](http://unmaintained.tech/) [![Build Status](https://ci.blackieops.com/buildStatus/icon?job=dev_containers-autobuild)][2]

Isolated development environments in Docker containers.

## Usage

Easiest would be to trust me and grab the [prebuilt versions on the Docker
Hub][1], which are built [via Jenkins][2] on every commit. Otherwise, you can
build them yourself.

For example, for `dev_ruby`:

```
$ docker build -t my_dev_ruby dev_ruby
```

Some containers support build-time arguments, for example:

```
$ docker build -t my_old_dev_ruby \
    --build-arg RUBY_MAJOR=2.1 \
	--build-arg RUBY_MINOR=10 \
	dev_ruby
```

---

To run the container, just mount the volume and expose the ports you need:

```
$ docker run -it --rm -v $(pwd):/data -p 5000:5000 alexblackie/dev_ruby
```

Running without arguments will spawn a shell for you. Alternatively, you can
provide arguments to `/bin/bash` to run things automatically:

```
$ docker run -it --rm -v $(pwd):/data -p 5000:5000 alexblackie/dev_ruby -lc "bundle exec rails s"
```

## License

See [LICENSE](./LICENSE).

[1]: https://hub.docker.com/u/alexblackie/
[2]: https://ci.blackieops.com/job/dev_containers-autobuild/
