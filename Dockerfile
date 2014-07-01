FROM pandeiro/oracle-jdk8
MAINTAINER Murphy McMahon <pandeiro.docker@gmail.com>

ENV LEIN_ROOT true

RUN wget -O /usr/bin/lein \
    https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein \
    && chmod +x /usr/bin/lein

RUN lein

VOLUME ["/project"]

WORKDIR /project

ENTRYPOINT ["lein"]
