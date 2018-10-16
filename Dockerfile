FROM php:7.1-apache

MAINTAINER Pedro de la Lastra <plmarcelo@gmail.com>

RUN apt-get update && apt-get install -y zlib1g-dev

RUN docker-php-ext-install pdo pdo_mysql mysqli opcache zip

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
