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
$DOCKER build -q --rm=true -t $DOCKER_REPO .

# run puppet
$DOCKER run -d $DOCKER_REPO \
  puppet apply --modulepath=/root/puppet/modules /root/puppet/manifests/site.pp > /dev/null

CID=$($DOCKER ps -q -l)
echo "Wating for container $CID"
$DOCKER wait $CID

echo "Committing changes and shutting down container $CID"
$DOCKER commit -m="Puppetized" $CID $DOCKER_REPO
$DOCKER stop $CID
$DOCKER rm $CID

# fire when ready!
printf "Run finished product... "
$DOCKER run -d -p 80:80 -p 81:81 $DOCKER_REPO
[ $? -eq 0 ] && echo "OK" || echo "Failed"

