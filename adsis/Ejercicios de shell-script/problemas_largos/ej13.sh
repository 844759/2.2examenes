#!/bin/bash

if [ $# -lt 1 ]
then
    email="as@as.unizar.es"
else
    email="$1"
fi

while read pid user comm
do

    if [ ! -f /tmp/$user ] 
    then
        echo "$user" >> /tmp/$user
    fi
    
    count=0
    while read child_pid
    do
        if ! ssh -n as@155.210.3.14 "cat /proc/$child_pid/status | egrep -q "(R|S)""
        then
            count=$(($count+1))
        fi
    done < <(ssh -n as@155.210.3.14 "pgrep -P$pid")

    if [ $count -gt 10 ]
    then
        ssh -n as@155.210.3.14 "renice +15 $pid"
        echo "$comm" >> /tmp/$user
    fi

done < <(ssh -n as@155.210.3.14 "ps -eo pid,user,comm | grep -v "PID"")

while read $user
do

    if ! test -s /tmp/$user
    then
        paste -d, /tmp/res /tmp/$user
    fi
    rm /tmp/$user

done < <(ssh -n as@155.210.3.14 "ps -eo user | sort | uniq")

cat /tmp/res | mail -s "Lista procesos" $email
rm /tmp/res