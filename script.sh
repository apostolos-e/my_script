#!/bin/bash
#./script.sh -f <filename> to specify file to write the output.
#./script.sh -s <filename> for cron scheduling.

function commands(){
    uptime | awk -F'[a-z]:' '{printf "%s\t", $2}' >> $FILE
    free -m | awk 'NR==2{printf "%s/%sMB(%.2f%%)\t", $3,$2,$3*100/$2 }' >> $FILE
    df -h | awk '$NF=="/"{printf "%d/%dGB(%s)\t", $3,$2,$5}' >> $FILE
    ps aux | awk '{printf "%s\n", $8}' | grep -c Z >> $FILE
}

function std_out(){
    while [ true ]
    do
        commands
        cat $FILE
        sleep 10s
        clear
    done
}

if [ $# -eq 0 ] 
then
    echo "Invalid argument please pass -f or -s."
fi

while getopts f:s flag
do
    case "${flag}" in
        f) 
            FILE="/home/$USER/${OPTARG}"
            std_out;;
        s) 
            FILE="/var/log/${OPTARG}"
            commands;;
        *) echo "Invalid argument";;
    esac
done
