FROM nginx:latest

#Copy my html page to webserver directory
COPY ./index.html /usr/share/nginx/html/index.html

#Expose port
EXPOSE 80