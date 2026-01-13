#!/bin/bash

#installing packages
sudo apt install wget unzip apache2 -y > /dev/null

#creating and cd in the directory
mkdir -p /tmp/webfiles
cd /tmp/webfiles

#downloading template and copy i/var/www/html directory
wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/

#restarted httpd service
systemctl restart apache2

#remove tmp files
rm -rf /tmp/webfiles


#service status
sudo systemctl status apache2 | grep active
ls /var/www/html
