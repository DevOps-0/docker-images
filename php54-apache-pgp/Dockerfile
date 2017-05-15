FROM profideo/php54-apache-node:22323-set-php-fpm

MAINTAINER Alban Duval <aduval@profideo.com>

RUN apt-get update
RUN apt-get install libreoffice -qq -u -y

RUN apt-get install bzip2 -qq -u -y 

# Install client php mongodb
RUN pecl install mongo
RUN /usr/local/bin/docker-php-ext-enable mongo
