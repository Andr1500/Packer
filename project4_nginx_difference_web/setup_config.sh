#!/bin/bash
# Script to install Nginx and enable on boot.
sleep 10
# Update your system:
sudo apt update -y
sudo apt upgrade -y
# Install Nginx:
sudo apt install -y nginx

#Start Nginx service and enable to start on boot:
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl restart nginx
