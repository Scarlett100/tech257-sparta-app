#!/bin/bash

# Update
sudo apt update -y

# Upgrade
# sudo apt upgrade -y

# new upgrade for bypassing all upgrades
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -yq

# Install nginx
sudo apt install -y nginx

#reverse proxy 
sudo sed -i "s|try_files .*;|proxy_pass http://127.0.0.1:3000;|g" /etc/nginx/sites-available/default

# Restart nginx
sudo systemctl restart nginx

# Enable nginx
sudo systemctl enable nginx

# Git Clone
git clone https://github.com/Scarlett100/tech257-sparta-app.git

# Install Node.js and npm
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# CD into app2 folder
cd tech257-sparta-app/app2

# Install npm dependencies
npm install

# Start npm (can also use node.js)
#npm start <-- not needed if doing pm2, because script will never reach pm2 if npm is started.

#stopPm2 before rerunning.
pm2 stop app.js

# Install pm2
sudo npm install pm2@latest -g

# Start app with pm2
pm2 start app.js
