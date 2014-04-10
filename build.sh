#!/bin/bash

DOCKER_VERSION="0.9.1"
DOCKER_INSTALLED=$(docker version 2> /dev/null | awk '/^Client/ {print $3}')
DOCKER_REPO="windowsrefund/apache"

error() {
  echo $1
  exit 1
}

[ "$DOCKER_INSTALLED" == "$DOCKER_VERSION" ] || {
  error "Exiting; please make sure docker ${DOCKER_VERSION} is installed and running."
}

[ -f Dockerfile ] || error "Missing Dockerfile"

sudo docker rmi -f $DOCKER_REPO &> /dev/null
sudo docker build -q --rm=true -t $DOCKER_REPO .

# run puppet
