# Development Containers

Currently a WIP experiment -- I'm attempting to move my development environments
into isolated Docker environments.

## Usage

Easiest would be to trust me and grab the [prebuilt versions on the Docker
Hub][1]. Otherwise, you can build them yourself.

For example, for `dev_ruby`:

```
$ cd dev_ruby
$ docker build -t dev_ruby .
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
