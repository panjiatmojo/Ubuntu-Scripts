#!/bin/bash

error=0
redirect=0

timestamp=`date +%s`
storage="result-$timestamp.csv"

if [ -z "$1" ]
  then
    target="http://www.google.com"
  else
    target=$1
fi


for i in `seq 1 1000`;
do

	echo $i
	start=`date +%s`
	result=`curl -s -o /dev/null -w "%{http_code}" $target -H 'Pragma: no-cache' -H 'Accept-Encoding: gzip, deflate, sdch' -H 'Accept-Language: en-US,en;q=0.8,ms;q=0.6,id;q=0.4' -H 'Upgrade-Insecure-Requests: 1' -H 'User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36' -H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H 'Cache-Control: no-cache' -H 'Connection: keep-alive' --compressed`
	end=`date +%s`

	result="$target,$start,$result,$[$end-$start]"

	echo $result

	echo $result >> $storage

	#if [ $result -eq 301 ]
	#	then
	#	redirect=$[$redirect+1]

	#	echo $redirect
	#fi
done