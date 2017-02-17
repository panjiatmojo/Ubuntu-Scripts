#!/bin/bash

if [ -z "$1" ]
  then
  	gluster_mode="client"
fi

# check the gluster mode
if [ $gluster_mode == 'client' ]
	then
		gluster_package="glusterfs-client"
	else
		gluster_package="glusterfs-server"
fi

# define variable here
gluster_file="gluster-install.log"

front_end_config="DEBIAN_FRONTEND=noninteractive"
gluster_repo="ppa:gluster/glusterfs-3.8"

eval "$front_end_config apt-get -y update" >> $gluster_file

# install python software
eval "$front_end_config apt-get -y install python-software-properties" >> $gluster_file

# add gluster repository
eval "$front_end_config add-apt-repository -y $gluster_repo" >> $gluster_file
eval "$front_end_config apt-get -y update" >> $gluster_file

# install gluster
eval "$front_end_config apt-get -y install $gluster_package" >> $gluster_file

# cleanup installation
eval "$front_end_config apt-get -y autoremove" >> $gluster_file

# ensure packaged installed
dpkg --list | grep gluster >> $gluster_file
