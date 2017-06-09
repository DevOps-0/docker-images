FROM profideo/php-5.4.45-fpm

RUN apt-get install -y apt-transport-https
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update
RUN apt-get install memcached -qq -u -y
RUN apt-get install php5-memcache -qq -u -y
RUN apt-get install nodejs npm nodejs-legacy -qq -u -y
RUN mkdir -p /home/profideo/.npm
RUN chown -R profideo /home/profideo/.npm
RUN npm install -g less
RUN npm install -g bower

# PHP configuration
COPY files/php.ini /usr/local/etc/php/php.ini

# Install imagemagick
RUN apt-get update && apt-get install -y librsvg2-2 librsvg2-bin librsvg2-dbg
RUN apt-get update && apt-get install -y imagemagick
COPY files/achillefy-regular_l-webfont.ttf /usr/share/fonts/achillefy-regular_l-webfont.ttf
COPY files/type-achille.xml /etc/ImageMagick/type-achille.xml
COPY files/type.xml /etc/ImageMagick/type.xml
RUN fc-cache -f -v

# Install dnsutils
RUN apt-get install dnsutils -qq -u -y

# Install wkhtmltopdf
RUN apt-get install bzip2 -qq -u -y
COPY files/wkhtmltopdf-0.9.9-static-amd64.tar.bz2 /tmp/wkhtmltopdf-0.9.9-static-amd64.tar.bz2
RUN tar xvjf /tmp/wkhtmltopdf-0.9.9-static-amd64.tar.bz2 -C /tmp
RUN mv /tmp/wkhtmltopdf /usr/local/bin/wkhtmltopdf
RUN chmod +x /usr/local/bin/wkhtmltopdf

# Install poppler-utils (tool for extract pdf's content)
RUN apt-get install poppler-utils -qq -u -y

# Install memcache
RUN apt-get -qq update
RUN apt-get install -qq -y memcached php5-memcache

# Install and enable mongo
RUN pecl install mongo
RUN /usr/local/bin/docker-php-ext-enable mongo

# Supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]

EXPOSE 1337
