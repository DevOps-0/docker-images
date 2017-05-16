FROM profideo/php56-apache-node

MAINTAINER Alban Duval <aduval@profideo.com>

# update apt
RUN apt-get update

# Install imagemagick
RUN apt-get install -y libmagickwand-dev
RUN pecl install imagick
RUN /usr/local/bin/docker-php-ext-enable imagick
