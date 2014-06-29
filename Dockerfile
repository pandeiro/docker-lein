FROM debian-oracle-jdk8
MAINTAINER Murphy McMahon

RUN wget -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

