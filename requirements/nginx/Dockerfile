FROM debian:bullseye

RUN apt-get update && apt-get -y upgrade && apt-get -y install nginx && apt-get -y install openssl

COPY default /etc/nginx/sites-available/.

CMD ["nginx", "-g", "daemon off;"]
