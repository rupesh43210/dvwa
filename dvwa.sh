#!/bin/bash
cd $HOME
mkdir /dvwa
cp $HOME/dvwa-deploy-on-host/* /dvwa/
cd /dvwa
apt update
apt install -y apache2 mariadb-server mariadb-client php php-mysqli php-gd libapache2-mod-php
apt install -y git
cd /var/www/html/
rm index.html
git clone https://github.com/digininja/DVWA.git
chown -R 777 DVWA
mv ./DVWA/* ./
cp /var/www/html/config/config.inc.php.dist /var/www/html/config/config.inc.php
clear
echo "////////////////////Its time to setup database///////////////////////////"

cd /dvwa
chmod +x /dvwa/db.sh
/dvwa/db.sh
