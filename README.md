# Alpine Server Image

Image based on ``alpine:3.8`` ([release notes][release:2018-06-26]).

This image consumes less than 6MB RAM (on startup).

```sh
rake restart && \
sleep 6 && \
docker ps | awk '{print $1}' | grep -v CONTAINER | while read line; do docker ps | grep $line | awk '{printf $NF" "}' && echo "scale=2; $(cat /sys/fs/cgroup/memory/docker/$line*/memory.usage_in_bytes)/1024/1024" | bc -l; done | sort | column -t
```

## Why?

### A complete init process

This image brings a 3 parts init system, composed of:

1. [``dumb-init``][dumb-init] minimal init system for Linux containers
2. [``ylem``][ylem] startup scripts execution
2. [``runit``][runit] services management

## Try

```
git clone git@github.com:SwagDevOps/image-alpine_server.git
cd image-alpine_server
bundle install --path vendor/bundle --without development
bundle exec rake build start exec
```

## Run tests

```
mkdir -p ssh/allow
cp ~/.ssh/id_rsa.pub ssh/allow/root
bundle exec rake restart
bundle exec rspec
```

Tests are executed over ``SSH``, and rely on minimal dependencies.

## See also

* [A minimal Ubuntu base image][phusion/baseimage-docker]
* [Alpine image with environment template and supervisord][qenv/alpine-base]

* [Petit état de l'art des systèmes d'initialisation][linuxfr:petit-etat-de-l-art]

[release:2018-06-26]: https://alpinelinux.org/posts/Alpine-3.8.0-released.html
[dumb-init]: https://github.com/Yelp/dumb-init
[ylem]: https://github.com/SwagDevOps/ylem
[runit]: http://smarden.org/runit/
[phusion/baseimage-docker]: https://github.com/phusion/baseimage-docker
[qenv/alpine-base]: https://github.com/qenv/alpine-base
[linuxfr:petit-etat-de-l-art]: https://linuxfr.org/news/petit-etat-de-l-art-des-systemes-d-initialisation-1
