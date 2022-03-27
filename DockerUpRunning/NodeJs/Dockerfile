FROM node:11.11.0

LABEL org.opencontainers.image.authors="Ruben Ricaurte <ricaurtef@gmail.com>"
LABEL org.opencontainers.image.rating="Five Stars"
LABEL org.opencontainers.image.class="First Class"

ARG AP=/data/app
ENV SC_PATH=/etc/supervisor/conf.d

# The daemon.
RUN apt-get update \
    && apt-get install --yes supervisor \
    && mkdir -p /var/log/supervisor \
    && rm -rf /var/lib/apt/lists/*

# Supervisor configuration.
COPY ./supervisord/conf.d/* $SC_PATH/

# Applicaton code.
COPY *.js* $AP/
WORKDIR $AP
RUN npm install

CMD ["supervisord", "-n"]
