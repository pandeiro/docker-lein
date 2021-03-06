# Leiningen Docker Image

A Leiningen image based on Debian Wheezy and
[Oracle JDK8](https://github.com/pandeiro/docker-oracle-jdk8).

## Build

```bash
git clone https://github.com/pandeiro/docker-lein && cd docker-lein

docker build -t 'lein' .
```

## Pre-built

```bash
docker pull pandeiro/lein
```

## Example Use Cases

These all assume you're using the pandeiro/lein image; otherwise
replace that with the name of your custom-built image.

Note: the image now sets `lein` as the default `ENTRYPOINT`.

### Clojure REPL

```bash
alias clj-repl='docker run -i -t pandeiro/lein repl'

clj-repl
```

### Project-specific REPL

```bash
cd /path/to/project

alias project-repl="docker run -i -t -v $(pwd):/app pandeiro/lein repl"

project-repl
```

### Dependency-cached lein

One issue (or feature, depending) with the above example is that it will download
a fresh copy of all of the project's dependencies every time a REPL is run. If you
prefer, you can generate an image with the dependencies already included. This bash
function will help with that.

```bash
cache-lein() {
    imagename="$1"
    docker run -v $(pwd):/app pandeiro/lein deps
    docker commit $(docker ps -a | awk '/lein deps/ {print $1}' | head -1) "$imagename"
}
```

### Development server

(Uses `cache-lein` function from above example.)

```bash
cd /path/to/ring-project

cache-lein project

alias ring="docker run -p 3000:3000 -v $(pwd):/app project ring"

ring server-headless
```

### Artifact builder

(Uses `ring` from above example.)

```bash

ring uberwar # war file appears in $PWD/target, just as with lein

```

### As a base image

You can build a Docker image from any leiningen-based project
by starting with

```
FROM pandeiro/lein:latest

COPY . /app

RUN lein deps

# ...
```

## License

Copyright © 2014 Murphy McMahon

Distributed under the Eclipse Public License either version 1.0 or (at
your option) any later version.

