#!/bin/bash

sec_delay=$(echo "24*60*60" | bc)

admin="admin@gmail.com"

while read pid ppid etimes user comm
do
    if [ $etimes -gt $sec_delay ]
    then
        kill $ppid
        echo "Se elimino un proceso zombie, cuyo comando fue: "$comm"" | mail -s "Creacion zombre" "$user@gmail.com"
        lista=$(echo "$pid, $comm")
    fi

done < <(ps -eo pid,ppid,etimes,euser,comm | grep -v "ELAPSED")

mail -s "Lista de procesos zombie eliminados" "$admin" < <(echo "$lista")
