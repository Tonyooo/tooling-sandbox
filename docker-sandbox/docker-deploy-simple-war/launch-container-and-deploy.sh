#!/bin/sh

JAVA_PROJECT_DIR=/home/tony/projects-sandbox/java/java-sandbox-servlet/servlet-gs

mvn -f $JAVA_PROJECT_DIR clean package
CONTAINER_ID="$(sudo docker run -d -p 8080:8080 tomcat:8)"
sudo docker cp ${JAVA_PROJECT_DIR}/target/*.war ${CONTAINER_ID}:/usr/local/tomcat/webapps

echo "Now you can browse http://localhost:8080/servlet-gs-1.0.0-SNAPSHOT/SimpleServlet"
