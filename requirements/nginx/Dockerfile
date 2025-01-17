FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade && apt-get -y install nginx && apt-get -y install openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       -out /etc/nginx/ssl/arguez.crt \
       -keyout /etc/nginx/ssl/arguez.key \
       -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=arguez/CN=arguez/"
RUN mkdir -p /run/nginx

EXPOSE	443

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
