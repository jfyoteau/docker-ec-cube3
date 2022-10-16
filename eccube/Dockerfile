FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
ENV TZ=Asia/Tokyo

RUN apt update \
    && apt install -y software-properties-common ca-certificates lsb-release apt-transport-https \
    git zip unzip apache2 curl \
    && LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
    && apt update \
    && apt install -y php5.6 php5.6-xdebug php5.6-xml php5.6-opcache php5.6-mysql php5.6-mbstring php5.6-json php5.6-gd php5.6-curl php5.6-zip

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/bin/ --filename=composer
RUN a2enmod rewrite
RUN mkdir -p /var/log/xdebug \
    && chown -R www-data:www-data /var/log/xdebug

COPY apache-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY php-xdebug.ini /etc/php/5.6/mods-available/xdebug.ini

CMD apachectl -D FOREGROUND
