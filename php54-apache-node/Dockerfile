FROM profideo/php-5.4.45-fpm:22323-set-php-fpm

MAINTAINER Alban Duval <aduval@profideo.com>

RUN apt-get install -y apt-transport-https
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN apt-get update
RUN apt-get install memcached -qq -u -y
RUN apt-get install php5-memcache -qq -u -y
RUN apt-get install nodejs npm -qq -u -y
RUN mkdir -p /home/profideo/.npm
RUN chown -R profideo /home/profideo/.npm
RUN npm install -g less
RUN npm install -g bower


