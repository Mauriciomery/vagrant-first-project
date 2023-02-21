#!/bin/bash

#Script de Shell para log-message-proccesor VM
#install git
sudo apt-get update
sudo apt-get install -y git
#clone repository
git clone https://github.com/bortizf/microservice-app-example.git
sudo chmod -R ugo+rwx microservice-app-example/ 
cd microservice-app-example/log-message-processor/
#install Redis
sudo apt install -y redis
#install Python3
sudo apt install -y python3
#install pip
sudo apt install -y python3-pip
#Building
echo "-------- Buildeando los requerimientos con PIP 3 ----------"
pip3 install -r requirements.txt
#Running
echo "*****------Corriendo Logmessageprocessor api -----*****"
REDIS_HOST=127.0.0.1 REDIS_PORT=6379 REDIS_CHANNEL=log_channel python3 main.py