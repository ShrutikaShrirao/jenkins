#!/bin/bash

# Install Nginx
sudo yum install nginx -y

# Start Nginx
sudo service nginx start

# Enable Nginx to start on boot
sudo chkconfig nginx on

# Ping localhost on port 80
curl http://localhost:80
