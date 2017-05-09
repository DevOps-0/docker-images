FROM profideo/php54-apache-node:22323-set-php-fpm

MAINTAINER Alban Duval <aduval@profideo.com>

RUN apt-get update
RUN apt-get install libreoffice -qq -u -y

RUN apt-get install bzip2 -qq -u -y 

# Install client php mongodb
RUN apt-get -t wheezy-backports install php5-mongo -qq -u -y
