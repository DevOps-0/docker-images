FROM profideo/php55-apache-node

MAINTAINER Alban Duval <aduval@profideo.com>

# update apt
RUN apt-get update

# Install imagemagick
RUN apt-get -y install php5-imagick
test -e '/etc/init.d/php5-fpm' && command service 'php5-fpm' 'restart'
test -e '/etc/init.d/apache2' && command service 'apache2' 'force-reload'
