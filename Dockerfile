FROM nginx:1.21.3-alpine

RUN apk add build-base python3 py3-pip
RUN apk add certbot
RUN pip3 install pip --upgrade
RUN pip3 install certbot-nginx
RUN mkdir /etc/letsencrypt

COPY nginx.conf /etc/nginx/nginx.conf
COPY conf.d/default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
