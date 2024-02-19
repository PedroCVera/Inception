FROM debian:11

RUN apt-get update\
    && apt-get install -y nginx openssl\
    && mkdir -p /var/www/ /etc/nginx/ssl/

RUN mkdir -p /run/nginx

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
-keyout /etc/nginx/ssl/nginx-selfsigned.key \
-out /etc/nginx/ssl/nginx-selfsigned.crt \
-subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=pcoimbra/CN=pcoimbra/"

COPY ./conf/nginx-def.conf /etc/nginx/conf.d

CMD ["nginx", "-g", "daemon off;"]
