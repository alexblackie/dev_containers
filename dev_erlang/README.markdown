# alexblackie/dev_erlang

## Usage

```
$ docker run -it --rm -v `pwd`:/data alexblackie/dev_erlang -lc 'rebar3 shell'
```

To reduce churn, have rebar throw its cache somewhere in `/data` and VCS-ignore
it. Edit your `rebar.config` to reflect:

```erlang
{global_rebar_dir, "./priv/rebar_cache"}.
```
