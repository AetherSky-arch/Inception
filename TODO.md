- Add TLS certification
  + This solves problems with port 8080 being busy on school computers
  + Because TLS certified goes through port 443

- Figure out how to access site at arguez.42.fr instead of 127.0.0.1 (localhost)
  + write the following line to /etc/hosts in nginx container
  + 127.0.0.1 arguez.42.fr
  + RUN echo "127.0.0.1 arguez.42.fr >> /etc/hosts"

- Figure out how to access admin page
  + 127.0.0.1/wp-admin
  + arguez.42.fr/wp-admin once /etc/hosts is set

- Figure out how to access mariadb shell
  + exec following command once containers are running
  + docker exec -it  mariadb sh

- Write a Makefile

- Put all the project in a VM at school
