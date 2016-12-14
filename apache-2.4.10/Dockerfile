FROM profideo/debian-jessie

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN echo 'deb http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN echo 'deb-src http://ftp.fr.debian.org/debian/ jessie non-free' >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y apache2=2.4.10-10+deb8u7
RUN a2enmod rewrite
RUN echo "umask 002" >> /etc/apache2/envvars

# Add user profideo to group www-data
RUN usermod -a -G www-data profideo

EXPOSE 80
