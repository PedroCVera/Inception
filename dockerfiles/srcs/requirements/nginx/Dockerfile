FROM debian:11

RUN apt-get update && \
	apt-get install -y nginx openssl vim && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*


#create directories for SSL certificates
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/pcoimbra.crt \
       -keyout /etc/nginx/ssl/pcoimbra.key \
       -subj "/C=PT/ST=Lisboa/L=Lisboa/O=42Lisboa/OU=pcoimbra/CN=localhost/"

COPY ./conf/nginx-def.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]
