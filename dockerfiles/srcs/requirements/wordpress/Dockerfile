# docker-compose down -v --rmi all --remove-orphans
# docker-compose up --build
# docker system prune -a --volumes

#base image
FROM debian:11

#install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    unzip \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-xml \
    php7.4-mbstring

#install wordpress
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar &&\
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

RUN mkdir /run/php/ && chmod 755 /run/php/

RUN sed -i 's+listen = /run/php/php7.4-fpm.sock+listen = 9000+g' /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wordpress_conf.sh /tmp/wordpress_conf.sh
RUN chmod +x /tmp/wordpress_conf.sh

#expose port used by php-fpm
EXPOSE 9000

#wordpress configuration
ENTRYPOINT ["/tmp/wordpress_conf.sh"]
