# Leiningen Docker Image

A Leiningen image based on Debian Wheezy and
[Oracle JDK8](https://github.com/pandeiro/docker-oracle-jdk8).

## Building

    git clone https://github.com/pandeiro/docker-lein && cd docker-lein
    
    docker build -t 'lein' .

## Usage

    docker pull pandeiro/lein

    alias lein='docker run -v $(pwd):/project pandeiro/lein'

    cd /path/to/project
    lein ring server

