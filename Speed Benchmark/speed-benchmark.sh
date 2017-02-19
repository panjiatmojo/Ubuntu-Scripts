#!/bin/bash

if [ -z "$1" ]
  then
  	target_disk="/tmp/"
  else
  	target_disk=$1
fi

timestamp=`date +%s`
filename="test-$timestamp.txt"

if [ -z "$2" ]
  then
    storage="speed-benchmark-$timestamp.log"
fi


filesystem=`df $target_disk | tail -1 | awk '{print $1}'`
testfile="$target_disk$filename"

for i in `seq 1 5`;
do
	#	measure the disk read speed
	eval "hdparm -Tt $filesystem" &>> $storage

	#	measure the disk write speed
	eval "dd if=/dev/zero of=$testfile bs=100M count=1 oflag=dsync" &>> $storage

	#	measure the disk latency
	eval "dd if=/dev/zero of=$testfile bs=512 count=1000 oflag=dsync" &>> $storage
done

rm $testfile
