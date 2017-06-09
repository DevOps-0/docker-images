FROM profideo/php-5.4.45-fpm

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

# PHP configuration
COPY files/php.ini /usr/local/etc/php/php.ini

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

EXPOSE 80
