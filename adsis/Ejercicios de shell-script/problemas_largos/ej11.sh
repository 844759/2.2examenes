#!/bin/bash

nodos=0
list_ver=()

for ip in 155.210.{0..255}.{0..255}
do

    ping -c2 -W2 $ip
    if [ $? -eq 0 ]
    then
        ver=$(ssh -n user@$ip "uname -r")
        if ! echo "$list_ver" | grep "$ver"
        then
            list_ver+=("$ver")
        fi 
        nodos=$(($nodos+1))
        echo "$ver" >> /tmp/versiones
    fi

done

echo ""$nodos" nodos linux"

for v in "${list_ver[@]}"
do
    lin=$(cat /tmp/versiones | grep "$v" | wc -l)
    por=$(echo "scale=2; (($lin/$nodos)*100)" | bc)
    echo "$v $por%"
done | sort -nr -k2