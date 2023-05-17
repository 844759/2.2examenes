#!/bin/bash

if [ $# -ne 2 ]
then
    echo "El script necesita de dos parametros para funcionar correctamente"
    exit 1
fi

prev=""

i=0
while read linea
do

    while [ "$linea" = "$prev" ]
    do
        read linea
    done

    if [ $i -eq 0 ]
    then
        i=$(($i+1))
    else
        echo "$prev" >> $2
    fi
    prev=$(echo "$linea")

done < $1

echo "$prev" >> $2