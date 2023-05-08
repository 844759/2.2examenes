#!/bin/bash

while read linea
do

    user=$( echo "$linea" | cut -d':' -f1 )
    echo "$user"
    
done < <(grep "/bin/bash" /etc/passwd)