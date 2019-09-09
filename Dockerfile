FROM php:7.3.9-fpm-alpine

LABEL maintainer="Fifths <ligangmingx@gmail.com>"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk update \
    && apk upgrade \
    && apk --update --virtual build-deps add \
        autoconf \
        make \
        gcc \
        g++ \
        libtool \
        pcre-dev \
        openssl-dev \
        freetype-dev libjpeg-turbo-dev libpng-dev \
        imap-dev \
        icu-dev \
        libxml2-dev \
        libzip-dev \
        bzip2-dev \
        gettext-dev \
        postgresql-dev \
        libxslt-dev \
        imagemagick-libs \
        imagemagick-dev \
        libmemcached-dev \
        openldap-dev \
    && apk add --no-cache \
        freetype libjpeg-turbo libpng \
        imagemagick \
        libmemcached \
        libpq \
        libxslt \
        libzip \
        c-client \
        icu \
    && docker-php-ext-configure gd \
           --with-gd \
           --with-freetype-dir=/usr/lib/ \
           --with-png-dir=/usr/lib/ \
           --with-jpeg-dir=/usr/lib/ \
    && docker-php-ext-configure imap -with-imap --with-imap-ssl \
    && docker-php-ext-configure intl \
    && docker-php-ext-configure ldap --with-libdir=lib/ \
    && docker-php-ext-install -j$(nproc) \
        ldap \
        zip \
        gd \
        imap \
        intl \
        bcmath \
        bz2 \
        calendar \
        exif \
        gettext \
        mysqli \
        opcache \
        pdo_mysql \
        pdo_pgsql \
        pgsql \
        soap \
        sockets \
        xmlrpc \
        xsl \
    && pecl install xdebug && docker-php-ext-enable xdebug \
    && yes '' | pecl install memcached && docker-php-ext-enable memcached \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && yes '' | pecl install redis && docker-php-ext-enable redis \
    && yes '' | pecl install imagick && docker-php-ext-enable imagick \
    && yes '' | pecl install apcu && docker-php-ext-enable apcu \
    && docker-php-source delete \
    && apk \
    del build-deps \
    && rm -rf /var/cache/apk/* /var/lib/apk/* /etc/apk/cache/* \
    && rm -rf /tmp/* /var/tmp/*