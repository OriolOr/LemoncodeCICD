ARG source
FROM nginx:1.19.0-alpine as app 

COPY nginx.conf /etc/nginx/nginx.conf 

WORKDIR /usr/share/nginx/html

COPY dist/  .

EXPOSE 8080

COPY ./entry-point.sh /
RUN chmod +x /entry-point.sh
ENTRYPOINT [ "sh", "/entry-point.sh" ] 
CMD [ "nginx", "-g", "daemon off;" ]