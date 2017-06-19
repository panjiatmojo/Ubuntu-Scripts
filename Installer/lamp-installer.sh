#!/bin/bash

# define variable here
lamp_installer="lamp-installer.log"

front_end_config="DEBIAN_FRONTEND=noninteractive"

#	get the public ip address
#ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

eval "$front_end_config apt-get update" &>> $lamp_installer
eval "$front_end_config apt-get install apache2" &>> $lamp_installer

eval "curl -kL http://localhost" &>> $lamp_installer

eval "$front_end_config apt-get install mysql-server php5-mysql" &>> $lamp_installer
eval "mysql_install_db" &>> $lamp_installer

eval "$front_end_config apt-get install php5 libapache2-mod-php5 php5-mcrypt" &>> $lamp_installer

eval "sudo service apache2 restart" &>> $lamp_installer