#!/bin/bash

#Script de Shell para Users-api VM
#Install git
sudo apt-get update
sudo apt-get install -y git
#clone repository
git clone https://github.com/bortizf/microservice-app-example.git
sudo chmod -R ugo+rwx microservice-app-example/ 
cd microservice-app-example/users-api/
sudo apt-get install -y openjdk-8-jdk
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64
sudo apt install -y maven
#Building
echo "------------Buildeando users app con Maven --------"
./mvnw clean install
#Running
echo "*****------Corriendo Users api -----*****"
JWT_SECRET=PRFT SERVER_PORT=8083 java -jar target/users-api-0.0.1-SNAPSHOT.jar

