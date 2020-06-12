# Pull base image 
FROM tomcat:8-jre8 


COPY ./web-app.war /usr/local/tomcat/webapps 