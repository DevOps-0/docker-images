FROM profideo/php73-apache

RUN apt-get update && apt-get install -y unzip wget

RUN docker-php-ext-install pcntl

RUN apt-get update && apt-get install -y fonts-liberation libappindicator3-1 libnspr4 libnss3 libx11-xcb1 libxss1 libxtst6 xdg-utils lsb-release
COPY files/google-chrome-stable_68_amd64.deb /tmp/google-chrome-stable_68_amd64.deb
RUN dpkg -i /tmp/google-chrome-stable_68_amd64.deb
RUN rm /tmp/google-chrome-stable_68_amd64.deb

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update && apt-get install oracle-java8-installer -y && apt-get clean

ADD https://chromedriver.storage.googleapis.com/2.41/chromedriver_linux64.zip /tmp/
RUN unzip -d /opt/ /tmp/chromedriver_linux64.zip
RUN rm /tmp/chromedriver_linux64.zip

ADD https://selenium-release.storage.googleapis.com/3.14/selenium-server-standalone-3.14.0.jar /opt/selenium-server-standalone.jar
RUN chmod o+r /opt/selenium-server-standalone.jar
