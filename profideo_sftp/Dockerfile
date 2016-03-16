FROM debian:wheezy

MAINTAINER Florent Degardin <fdegardin@profideo.com>

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install openssh-server

# config ssh for easy access
RUN sed -i 's/^PermitRootLogin/# PermitRootlogin/' /etc/ssh/sshd_config
RUN echo 'root:root' | chpasswd
RUN mkdir -p /root/.ssh

RUN apt-get install -y vim

# Set locale
RUN apt-get -qqy install locales
RUN sed -i 's/# fr_FR.UTF-8 UTF-8/fr_FR.UTF-8 UTF-8/' /etc/locale.gen
RUN /usr/sbin/locale-gen
ENV LANG fr_FR.UTF-8
ENV LANGUAGE fr_FR:fr
ENV LC_ALL fr_FR.UTF-8

# Add profideo_sftp user for deployment - force uid to 1000 as it is the profideo_sftp uid on host (mapping necessary for nice rights sharing)
RUN useradd --system --uid=1000 -s /bin/bash -m -d /home/profideo_sftp profideo_sftp
RUN echo 'profideo_sftp:profideo' | chpasswd
RUN mkdir -p /home/profideo_sftp/.ssh
RUN chown -R profideo_sftp:profideo_sftp /home/profideo_sftp/.ssh

# Install useful apps
RUN apt-get install -y -q screen
RUN apt-get install -y -q emacs
RUN apt-get install -y -q tree
COPY ./files/emacs.conf /home/profideo_sftp/.emacs
COPY ./files/vimrc.conf /etc/vim/vimrc
COPY ./files/gitconfig /home/profideo_sftp/.gitconfig
COPY ./files/bashrc /home/profideo_sftp/.bashrc

# Create ftp group
RUN groupadd ftp

# Add user profideo_sftp to group www-data
RUN usermod -a -G ftp profideo_sftp

# Generate ssh key
RUN ssh-keygen -t rsa -f /home/profideo_sftp/.ssh/id_rsa -N ''

# install supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/run/sshd /var/log/supervisor

# supervisor config
COPY ./files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

CMD ["/usr/bin/supervisord"]

EXPOSE 22

