FROM debian:stretch
LABEL maintainer="NatisCoin Developers <dev@natiscoin.org>"
LABEL description="Dockerised NatisCoinCore, built from Travis"

RUN apt-get update && apt-get -y upgrade && apt-get clean && rm -fr /var/cache/apt/*

COPY bin/* /usr/bin/
