#!/bin/bash

echo "ready!"

while :
do
    established=$(eval "netstat -anop | grep -E ':80\s|:443\s' | grep 'ESTABLISHED' | wc -l")
    total=$(eval "netstat -anop | grep -E ':80\s|:443\s' | wc -l")
    php_process=$(eval "ps -ef | grep -E 'php|apache2|fpm' | wc -l")

    echo "established: "  $established
    echo "total: "  $total
    echo "process php:" $(expr $php_process - 1)
    echo "----------------"
    sleep 5

done
