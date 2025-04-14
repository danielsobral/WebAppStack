FROM nginx:alpine3.21

RUN  rm -rf /etc/nginx/conf.d/default.conf && \
    mkdir -p /etc/nginx/ssl

COPY ./config/nginx.conf /etc/nginx/conf.d
COPY ./config/ssl/. /etc/nginx/ssl

ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "nginx", "-g", "daemon off;" ]