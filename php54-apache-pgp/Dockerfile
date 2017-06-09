FROM profideo/php54-apache-node

RUN apt-get update
RUN apt-get install libreoffice -qq -u -y

RUN apt-get install bzip2 -qq -u -y 

# Install client php mongodb
RUN pecl install mongo
RUN /usr/local/bin/docker-php-ext-enable mongo

# PHP configuration
COPY files/php.ini /usr/local/etc/php/php.ini

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
