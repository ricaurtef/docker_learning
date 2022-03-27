FROM ubuntu:latest
LABEL org.opencontainers.image.authors='Ruben Ricaurte <ricaurtef@gmail.com>' \
      org.opencontainers.image.description='This example Dockerfile installs NGINX.'

RUN apt-get update && apt-get install --yes nginx \
    && rm -rf /var/lib/apt/lists/* \
    && adduser --system --no-create-home --shell /bin/false --group \
               --disabled-login nginx \
    && mkdir -p /tmp/nginx/
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf
ADD files/html.tar.gz /usr/share/nginx/

EXPOSE 80/tcp

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
