from tianon/debian:wheezy
maintainer Adam Kosmin
RUN apt-get update && apt-get -y install puppet
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENTRYPOINT ["/usr/sbin/apache2"]
CMD ["-D", "FOREGROUND"]
ADD puppet /root/puppet
