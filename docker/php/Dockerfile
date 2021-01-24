FROM composer:2.0 as composer

FROM php:7.4-fpm

RUN apt-get update && \
apt-get install -y \
libzip-dev

RUN docker-php-ext-install pdo_mysql

RUN pecl install apcu

RUN docker-php-ext-install zip
RUN docker-php-ext-enable apcu

WORKDIR /usr/src/app

RUN PATH=$PATH:/usr/src/app/vendor/bin:bin

RUN composer install --no-scripts --prefer-dist \
  && rm -rf "$(composer config cache-dir)" "$(composer config data-dir)"
