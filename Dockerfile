FROM debian:bullseye

RUN apt-get update && apt-get install -y nginx && apt-get install curl gpg -y && apt-get install vim -y
RUN apt-get install tor -y
RUN apt-get install -y supervisor

COPY supervisord.conf /etc/supervisor/supervisord.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./index.html /var/www/html/index.html
COPY ./torrc /etc/tor/torrc
RUN mkdir  /var/lib/tor/hidden_service/
RUN chmod 700 /var/lib/tor/hidden_service/
COPY ./init_script.sh /usr/local/bin/init_script.sh
RUN chmod +x /usr/local/bin/init_script.sh

EXPOSE 80
#EXPOSE 9050

ENTRYPOINT ["/usr/local/bin/init_script.sh"]