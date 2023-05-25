#!/bin/bash

if [ "$UID" -ne 0 ]
then
    echo "Se necesita ser admin"
    exit 1
fi

while read linea
do

    used=$( echo "$linea" | awk '{print $3;}' )
    if [ $used -eq 0 ]
    then
        mod=$(echo "$linea" | awk '{print $1;}' )
        rmmod "$mod"
    fi

done < <(lsmod | grep -v "Used by" )