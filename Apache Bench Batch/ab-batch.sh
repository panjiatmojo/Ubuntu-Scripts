#!/bin/bash

if [ -z "$1" ]
  then
    echo "Please provide the target URL"
    exit
fi

timestamp=`date +%s`

# check and assign default result file
if [ -z "$2" ]
  then
    storage="ab-batch-$timestamp.log"
fi

banner=("Web Load Test to $1 started at $timestamp")

echo $banner

#	store banner to file result
echo $banner &>> $storage

#	set the target as supplied by arguments
target=$1

#	set concurrency step
concurrency=( 1 5 10 20 50)

#	loop all the concurrency steps
for i in "${concurrency[@]}"
do

echo "start concurrency $i" &>> $storage
eval "ab -n 1000 -c $i $target" &>> $storage

echo $'\r'$'\r' &>> $storage

done