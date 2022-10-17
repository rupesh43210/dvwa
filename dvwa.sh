
#!/bin/bash
for i in 1 2 3 4 5
do
   echo "ENSURE YOU ARE SUDO if not pleaee press cntrl+C and do sudo su within 30 seconds $i times"
   
   sleep 2
done

sleep 10


cd $HOME
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
echo "////////////////////Its time to setup database///////////////////////////"

cd /dvwa
chmod +x /dvwa/db.sh
/dvwa/db.sh
