#!/bin/bash

DOCKER_VERSION="0.9.1"
DOCKER_REPO="windowsrefund/apache"
DOCKER_INSTALLED=$(docker version 2> /dev/null | awk '/^Client/ {print $3}')
DOCKER_HOST=${1:-unix:///var/run/docker.sock}
DOCKER="sudo docker -H $DOCKER_HOST "

error() {
  echo $1
  exit 1
}

[ "$DOCKER_INSTALLED" == "$DOCKER_VERSION" ] || {
  error "Exiting; please make sure docker ${DOCKER_VERSION} is installed and running."
}

[ -f Dockerfile ] || error "Missing Dockerfile"

$DOCKER rmi -f $DOCKER_REPO &> /dev/null
$DOCKER -q --rm=true -t $DOCKER_REPO .

# run puppet
