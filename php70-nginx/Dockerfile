FROM profideo/php-7.0.10-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install nodejs and npm
RUN apt-get update && apt-get install -y \
   nodejs \
   npm
RUN ln -s /usr/bin/nodejs /usr/bin/node

# Nginx configuration
COPY files/nginx.conf /etc/nginx/nginx.conf

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
