#!/bin/bash

if [ -f /tmp/Comp ]
then
    nComp=$(cat /tmp/Comp)
    nComp=$(($nComp + 1))
    echo "$nComp" > /tmp/Comp
else
    nComp=1
    echo "$nComp" > /tmp/Comp
fi

while read linea
do

    mod=$(echo "$linea" | awk '{print $1;}')
    usos=$(echo "$linea" | awk '{print $3;}' )

    if [ $usos -ge 3 -a $nComp -eq 1 ]
    then
        echo "$mod" >> /var/run/modules.txt
    elif [ $usos -lt 3 -a $nComp -gt 1 ]
    then

        if grep "$mod" /var/run/modules.txt
        then
            grep -v "$mod" /var/run/modules.txt > /var/run/modules.txt
        fi

    fi

done < <(lsmod | grep -v "Module")

if [ $nComp -eq 12 ]
then
    rm /tmp/Comp
    rm /var/run/modules.txt
    cat /var/run/modules.txt | sort | mail -s "modulos más empleados" user
fi