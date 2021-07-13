#!/bin/bash

rm log_file.txt
touch log_file.txt

while [ true ]
do
    uptime | awk -F'[a-z]:' '{printf "%s\t", $2}' >> log_file.txt
    free -m | awk 'NR==2{printf "%s/%sMB(%.2f%%)\t", $3,$2,$3*100/$2 }' >> log_file.txt
    df -h | awk '$NF=="/"{printf "%d/%dGB(%s)\t", $3,$2,$5}' >> log_file.txt
    ps aux | awk '{printf "%s\n", $8}' | grep -c Z >> log_file.txt

    cat log_file.txt

    sleep 10s
    clear
done
