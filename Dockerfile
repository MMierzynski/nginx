FROM nginx:1.20

RUN apt-get update && \
    apt-get upgrade -y

RUN groupadd -g 10001 app && \
    useradd -u 10000 -g app app && \
    mkdir -p /var/run/nginx /var/tmp/nginx && \
    chown -R app:app /usr/share/nginx /var/run/nginx /var/tmp/nginx

COPY ./config/nginx.conf /etc/nginx/nginx.conf

USER app:app

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]