FROM debian:11

RUN apt-get update && apt-get install -y \
 	php7.4 php7.4-mysql php7.4-fpm php7.4-curl php7.4-gd \
	php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml \
	php7.4-xmlrpc php7.4-zip wget mariadb-client php7.4-redis \
 	&& rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get upgrade -y && apt-get install -y vim 

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wp-entrypoint.sh /opt/wp-entrypoint.sh

RUN chmod +x /opt/wp-entrypoint.sh

EXPOSE 9000

ENTRYPOINT [ "/opt/wp-entrypoint.sh" ]

CMD ["/usr/sbin/php-fpm7.4", "-F", "--nodaemonize"]
