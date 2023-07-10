ARG WORDPRESS_VERSION=latest
FROM wordpress:${WORDPRESS_VERSION}

LABEL maintainer="Truong Thanh Tung <ttungbmt@gmail.com>"

RUN apt-get update -y && apt-get install -y telnet iputils-ping

RUN curl -fsSL -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar | bash && \
    chmod +x /usr/local/bin/wp

ARG USER=ubuntu
ARG WWWGROUP=1000
ARG WWWUSER=1000

RUN groupadd --force -g $WWWGROUP $USER
RUN useradd -ms /bin/bash --no-user-group -g $WWWGROUP -u $WWWUSER $USER

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh