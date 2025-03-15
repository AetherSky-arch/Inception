FROM debian:bullseye

RUN apt update && apt -y upgrade && apt install php php-fpm php-mysqli curl sendmail -y
RUN mkdir -p /run/php/

COPY www.conf /etc/php/7.4/fpm/pool.d/.
COPY get_site.sh .
RUN chmod +x ./get_site.sh

CMD ["./get_site.sh"]
