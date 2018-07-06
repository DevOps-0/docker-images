FROM profideo/php-7.2-fpm:replace-nginx-with-apache

# Install apt-transport-https
RUN apt-get update && apt-get install -y apt-transport-https

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP extensions
RUN apt-get update && apt-get install -y zlib1g-dev
RUN docker-php-ext-install pdo pdo_mysql zip sockets

# Install ClamAV
RUN apt-get update && apt-get install -y clamav clamav-freshclam clamav-daemon

# Install nodejs
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && apt-get install -y nodejs npm nodejs-legacy

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
