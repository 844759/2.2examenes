#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Debe introducir una salida de traceroute"
    exit 1
fi

nodos=0

while read linea
do
    ip=$(echo "$linea" | cut -d' ' -f3)

    v1=$(echo "$linea" | cut -d' ' -f4)
    v2=$(echo "$linea" | cut -d' ' -f6)
    v3=$(echo "$linea" | cut -d' ' -f8)

    avg_rtt=$(echo "scale=3; ($v1 + $v2 + $v3) / 3" | bc)

    nodos=$(($nodos+1))        
    # Guardar el nodo y el RTT medio en un array asociativo
    rtt[$nodos]=$(echo "$ip: $avg_rtt")

done < <( cat $1 | tail -n +2)


echo "Numero de nodos visitados: $nodos"

# Ordenar los nodos por RTT medio en orden descendente y mostrar los cinco primeros
echo "Los 5 nodos con mayor RTT medio:"
for nodos in "${!rtt[@]}"
do
    echo "$nodos: ${rtt[$nodos]}"
done | sort -rn -k3 | head -n5
