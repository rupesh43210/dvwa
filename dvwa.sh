
#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   echo " do a sudo su"
   exit 1
fi

cd $HOME
mkdir $HOME/dvwa
cp -r /home/ubuntu/dvwa*/* $HOME/dvwa/
mkdir /dvwa
cp $HOME/dvwa*/* /dvwa

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
echo "////////////////////Settingup database///////////////////////////"

cd /dvwa
chmod +x /dvwa/db.sh
/dvwa/db.sh


echo "#################################################################Final Steps#############################################################"
extaddr=$(curl -s ifconfig.me)

if [ -z "$extaddr" ]
then
      echo "set up dvwa by vistiting host at public address  http://localhost/setup.php
else
      eecho "set up dvwa by vistiting host at public address  http://"$extaddr"/setup.php
fi

#echo "set up dvwa by vistiting host at public address  http://"$extaddr"/setup.php or http://localhost/setup.php"

echo "#################################################################Final Steps#############################################################"



