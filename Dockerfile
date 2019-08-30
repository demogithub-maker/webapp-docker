FROM tomcat:8.0-alpine

LABEL maintainer="shridhar.kapshikar@hotmail.com"

COPY ./SampleWebApp.war /usr/local/tomcat/webapps/

RUN apk update && apk add curl && rm -rf /var/cache/apk/*

EXPOSE 8080

CMD ["catalina.sh", "run"]
