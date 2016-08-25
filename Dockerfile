FROM php:7.0-fpm

ADD . /var/www/html
ADD ./docker/fpm/etc/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./docker/fpm/etc/php.ini /usr/local/etc/php

WORKDIR /var/www/html

RUN apt-get update \
 && apt-get -yq --no-install-recommends install \
        curl \
        zlib1g-dev \
 && docker-php-ext-install \
        zip \
        pdo_mysql \
        mysqli \
 && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
 && composer global require "fxp/composer-asset-plugin:^1.2.0" \
 && composer install --quiet --no-ansi --working-dir=/var/www/html --no-interaction --optimize-autoloader

VOLUME ["/var/www/html"]