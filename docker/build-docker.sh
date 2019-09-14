#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/..

DOCKER_IMAGE=${DOCKER_IMAGE:-natiscoinpay/natiscoind-develop}
DOCKER_TAG=${DOCKER_TAG:-latest}

BUILD_DIR=${BUILD_DIR:-.}

rm docker/bin/*
mkdir docker/bin
cp $BUILD_DIR/src/natiscoind docker/bin/
cp $BUILD_DIR/src/natiscoin-cli docker/bin/
cp $BUILD_DIR/src/natiscoin-tx docker/bin/
strip docker/bin/natiscoind
strip docker/bin/natiscoin-cli
strip docker/bin/natiscoin-tx

docker build --pull -t $DOCKER_IMAGE:$DOCKER_TAG -f docker/Dockerfile docker
