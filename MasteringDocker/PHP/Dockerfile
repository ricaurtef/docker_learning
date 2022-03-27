FROM ubuntu:latest
LABEL org.opencontainers.image.authors='Ruben Ricaurte <ricaurtef@gmail.com>'
LABEL org.opencontainers.image.description='This example Dockerfile installs \
Apache & PHP.'

ARG PHP_VERSION=7.4
ARG TZ=America/Argentina/Buenos_Aires
ARG APACHE2_ROOT=/var/www/html

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    && apt-get update && apt-get install --yes \
        apache2 \
        php${PHP_VERSION} \
        libapache2-mod-php${PHP_VERSION} \
    && rm -rf /var/lib/apt/lists/* \
    && mv $APACHE2_ROOT/index.html $APACHE2_ROOT/index.html.org \
    && echo "<?php phpinfo(); ?>" > $APACHE2_ROOT/index.php \
    && chmod 755 $APACHE2_ROOT/index.php

EXPOSE 80/tcp

ENTRYPOINT ["apachectl"]
CMD ["-D", "FOREGROUND"]
