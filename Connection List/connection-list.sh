#!/bin/bash

timestamp=`date +%s`

# check and assign default result file
if [ -z "$2" ]
  then
    storage="connection-list-$timestamp.log"
fi


i=0
while [ $i -lt 6 ]
do
	result=`netstat -anpt | grep -E "WAIT|ESTABLISHED" | awk '{ print  $4 "," $5 }' | sed -e 's,::1,localhost,g' | cut -d':' -f1-9 --output-delimiter=',' | sort -u`
	i=$[$i+1]
	echo $result >> $storage
	sleep 5m
done