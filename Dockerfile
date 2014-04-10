from tianon/debian:wheezy
maintainer Adam Kosmin
RUN apt-get update && apt-get -y install puppet
ADD puppet /root/puppet
