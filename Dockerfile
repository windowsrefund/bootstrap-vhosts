from tianon/debian:wheezy
maintainer Adam Kosmin
RUN apt-get update && apt-get -y install puppet vim
ADD puppet /root/puppet
