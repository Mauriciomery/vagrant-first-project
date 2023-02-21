#!/bin/bash

#Script de Shell para frontend VM
#install git
sudo apt-get update
sudo apt-get install -y git
#clone repository
git clone https://github.com/bortizf/microservice-app-example.git
sudo chmod -R ugo+rwx microservice-app-example/ 
cd microservice-app-example/frontend/
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
echo "--------------Buildeando el front con NPM -----------"
sudo npm install --unsafe-perm=true --allow-root
sudo npm audit fix
sudo npm run build
#Running
echo "*****------Corriendo el Front -----*****"
PORT=9050 AUTH_API_ADDRESS=http://192.168.50.12:8000 TODOS_API_ADDRESS=http://192.168.50.14:8082 npm start