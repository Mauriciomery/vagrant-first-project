#!/bin/bash

#Script de Shell para Auth-api VM
#install git
sudo apt-get update
sudo apt-get install -y git
#clone repository
git clone https://github.com/bortizf/microservice-app-example.git
sudo chmod -R ugo+rwx microservice-app-example/ 
cd microservice-app-example/auth-api/
#install go latest version
sudo snap install go  --classic
#Building
echo "-----------Empezando a buildear con GO ------------"
export GO111MODULE=on
go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api
go mod tidy
go build
#Running
echo "*****------Corriendo Auth api -----*****"
JWT_SECRET=PRFT AUTH_API_PORT=8000 USERS_API_ADDRESS=http://192.168.50.11:8083 ./auth-api

