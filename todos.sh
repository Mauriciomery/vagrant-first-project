#!/bin/bash

#Script de Shell para TODOs-api VM
#install git
sudo apt-get update
sudo apt-get install -y git
#clone repository
git clone https://github.com/bortizf/microservice-app-example.git
sudo chmod -R ugo+rwx microservice-app-example/ 
cd microservice-app-example/todos-api/
#install curl
sudo apt install -y curl
#install NVM
echo "----------- Instalando NVM a traves de Curl -------------"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash  
#loading NVM
echo "----------Reloading NVM----------"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#instalando la version correcta de Node y NPM
nvm install node
nvm install 8.17.0
nvm use 8.17.0
#building
echo "----------- Building TODOs API con NPM -------------"
npm install
#Running
echo "*****------Corriendo TODOs api -----*****"
JWT_SECRET=PRFT TODO_API_PORT=8082 npm start