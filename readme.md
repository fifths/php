# Alpine PHP-FPM Docker Image

Docker container to install and run [PHP-FPM](https://www.php.net/).

[![Build Status](https://travis-ci.org/fifths/php-fpm.svg?branch=master)](https://travis-ci.org/fifths/php-fpm)
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)](https://hub.docker.com/r/fifths/php-fpm)

## Supported branches 

- 7.3.9 [Dockerfile](https://github.com/fifths/php-fpm/blob/master/7.3.9/Dockerfile)

## Getting image

```sh
docker pull fifths/php-fpm
```

## Running your PHP script

```sh
sudo docker container run --rm -v $(pwd):/var/www/html fifths/php-fpm php index.php
```

## Running as server

```sh
sudo docker container run --rm --name php-fpm -v $(pwd):/var/www/html -p 8080:8080 fifths/php-fpm php -S="0.0.0.0:8080" -t="/var/www/html"
```

## using  [Docker Compose](https://docs.docker.com/compose/)

```sh
version: '3'
services:
  php-fpm:
    container_name: php-fpm
    image: fifths/php-fpm
    ports:
      - 8080:8080
    volumes:
      - ./:/var/www/html
    command: php -S="0.0.0.0:8080" -t="/var/www/html"
```

```sh
version: '3'
services:
    php-fpm:
        image: fifths/php-fpm
        ports:
            - "9000:9000"
        restart: always
        volumes:
            - "./:/var/www/html:rw"
        command:
            - /bin/bash
            - -c
            - |
                cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
                php-fpm
        environment:
            TZ: "Asia/Shanghai"
```


### [PHP Modules]
- apcu
- bcmath
- bz2
- calendar
- Core
- ctype
- curl
- date
- dom
- exif
- fileinfo
- filter
- ftp
- gd
- gettext
- hash
- iconv
- imagick
- imap
- intl
- json
- ldap
- libxml
- mbstring
- memcached
- mongodb
- mysqli
- mysqlnd
- openssl
- pcre
- PDO
- pdo_mysql
- pdo_pgsql
- pdo_sqlite
- pgsql
- Phar
- posix
- readline
- redis
- Reflection
- session
- SimpleXML
- soap
- sockets
- sodium
- SPL
- sqlite3
- standard
- tokenizer
- xdebug
- xml
- xmlreader
- xmlrpc
- xmlwriter
- xsl
- Zend OPcache
- zip
- zlib

### [Zend Modules]
- Xdebug
- Zend OPcache
