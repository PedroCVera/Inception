FROM debian:11

RUN apt-get update && apt-get install -y nginx openssl vim

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
