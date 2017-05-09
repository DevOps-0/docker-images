FROM profideo/php-5.4.45-fpm:22323-set-php-fpm

MAINTAINER Alban Duval <aduval@profideo.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN apt-get update

# Install nslookup (use in comparateur)
RUN apt-get install -y dnsutils

# Install imagemagick
RUN apt-get install -y imagemagick
RUN apt-get -y install php5-imagick

EXPOSE 80
