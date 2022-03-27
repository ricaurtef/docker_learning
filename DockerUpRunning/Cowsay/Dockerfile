FROM ubuntu
# MAINTAINER has been deprecated
# MAINTAINER Ruben Ricaurte <ricaurtef@gmail.com>
LABEL 'maintainer'='Ruben Ricaurte <ricaurtef@gmail.com>'
RUN apt-get update && apt-get install -y cowsay fortune python3
COPY entrypoint.py /usr/local/sbin/entrypoint
ENTRYPOINT ["entrypoint"]
