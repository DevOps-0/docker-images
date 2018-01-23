FROM profideo/php-7.1.6-fpm

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN apt-get update && apt-get install -y zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql zip

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs
# @see http://symfony.com/doc/current/frontend/encore/installation.html
RUN npm install -g @symfony/webpack-encore --save-dev

# Nginx configuration
COPY files/nginx.conf /etc/nginx/nginx.conf

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
