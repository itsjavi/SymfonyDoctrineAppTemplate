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

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer
