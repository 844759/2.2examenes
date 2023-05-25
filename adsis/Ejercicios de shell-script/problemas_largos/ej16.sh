#!/bin/bash

if [ $# -lt 1 ]
then
    exit 0
fi

max=0
n_max=0
for fich in $@
do
    if [ -r $fich ]
    then

        n_linea=0
        while read -r linea
        do
            aux=$(echo -n "$linea" | wc -m)
            if [ $aux -gt $max ]
            then
                max=$aux
                nombre_max=$fich
                linea_max=$linea
                n_max=$n_linea
            fi
            n_linea=$(($n_linea+1))
        done < $fich
    fi
done

echo "$nombre_max, $n_max, $linea_max"