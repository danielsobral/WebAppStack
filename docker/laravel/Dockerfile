ARG PHP_VERSION=8.4.5

FROM php:${PHP_VERSION}-fpm-alpine

WORKDIR /var/www

COPY ./executables/copy-laravel-files.sh /var/www

COPY ./executables/clear.sh /var/www

RUN apk update && \
    apk add --no-cache $PHPIZE_DEPS linux-headers postgresql-dev nodejs npm && \
    docker-php-ext-install pdo pdo_pgsql && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.mode=debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.client_port=9003" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.idekey=VSCODE" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.start_with_request=yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.client_host=host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini && \
    adduser -D -u 1000 laravel && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'.PHP_EOL; } else { echo 'Installer corrupt'.PHP_EOL; unlink('composer-setup.php'); exit(1); }" && \
    php composer-setup.php && \
    php -r "unlink('composer-setup.php');" && \
    mv composer.phar /usr/local/bin/composer && \
    mkdir /tmp/laravel-backup && \
    chmod +x /var/www/copy-laravel-files.sh && \
    chmod +x /var/www/clear.sh && \
    composer create-project --prefer-dist laravel/laravel investplusplus && \
    rm -rf /var/www/html && \
    cd /var/www/investplusplus && \
    npm install && \
    cp -a /var/www/investplusplus/. /tmp/laravel-backup/ && \
    chown -R laravel:laravel /var/www/investplusplus/

WORKDIR /var/www/investplusplus

EXPOSE 9000

ENTRYPOINT [ "/var/www/copy-laravel-files.sh" ]
CMD [ "php-fpm" ]