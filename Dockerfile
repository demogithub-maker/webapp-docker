FROM tomcat:8.0-alpine

LABEL maintainer="shridhar.kapshikar@hotmail.com"

COPY ./SampleWebApp.war /usr/local/tomcat/webapps/

EXPOSE 8081

CMD ["catalina.sh", "run"]
