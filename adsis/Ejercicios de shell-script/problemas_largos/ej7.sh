#!/bin/bash

if [ "$UID" -ne 0 ]
then
    echo "Se necesitan privilegios de admin"
    exit 1
fi
# Guardar el estado de todos sus procesos
while read linea
do
    pid=$(echo "$linea" | awk '{print $1;}')
    if [ -f "/proc/$pid/status" ] 
    then
        cat "/proc/$pid/status" >> /tmp/Process_status
    fi
done < <(ps -e)

while read pid
do
    if [ -f "/proc/$pid/status" ] 
    then
        # Obtenemos la memoria residente
        RSS_mem=$(cat "/proc/$pid/status" | grep "VmRSS" | awk '{print $2;}')

        # Leemos el pid de sus hijos y sumamos la memoria residente
        while read child_pid
        do
            if [ -f "/proc/$child_pid/status" ] 
            then
                RSS_nieto=$(grep "VmRSS" "/proc/$child_pid/status" | awk '{print $2;}')
                RSS_mem=$(($RSS_mem + $RSS_nieto))
            fi
        done < <(pgrep -P$pid)

        # Mostramos el proceso con la memoria residente usada
        nombre=$(ps -e | grep "$pid" | awk '{print $2;}')
        echo "$pid, "$nombre", $RSS_mem KB"
    fi

done < <(pgrep -P1) | sort -nr -t ' ' -k3 > /tmp/list

while read linea
do
    pid=$(echo "$linea" | awk -F ',' '{print $1;}')
    renice +15 "$pid"
done < <(cat /tmp/list | head -n4 )

cat /tmp/list
rm /tmp/list