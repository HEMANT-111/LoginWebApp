FROM tomcat:latest
RUN rm -rf /usr/local/tomcat/webapps/*
COPY LoginWebApp.war /usr/local/tomcat/webapps/
EXPOSE 8070
CMD ["catalina.sh", "run"]
