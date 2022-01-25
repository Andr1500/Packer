sleep 30
sudo apt update
sleep 20
sudo apt install nginx -y
sleep 5
sudo systemctl start nginx
sudo systemctl enable nginx
sudo ufw allow 'nginx full'
sudo ufw reload
