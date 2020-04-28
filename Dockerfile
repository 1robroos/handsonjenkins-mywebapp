# https://www.katacoda.com/courses/docker/create-nginx-static-web-server
FROM nginx:alpine
COPY html/* /usr/share/nginx/html
