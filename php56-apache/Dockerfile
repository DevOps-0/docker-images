FROM profideo/php-5.6.20-fpm

# Install sass
RUN apt-get install -y rubygems build-essential
RUN gem install sass

# PHP configuration
COPY php.ini /usr/local/etc/php/php.ini

# Supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]
