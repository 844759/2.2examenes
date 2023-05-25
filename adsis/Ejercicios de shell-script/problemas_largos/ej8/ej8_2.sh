#!/bin/bash

fich_Or=$( ssh -n as@172.16.0.1 "cat /etc/hosts" )

for ip in 172.16.0.{2..255}
do
    fich_Nw=$( ssh -n as@$ip "cat /etc/hosts" )
    if [ "$fich_Or" != "$fich_Nw" ]
    then
        nodos+=" $ip"
    fi
done

echo "$nodos" | mail -s "Lista nodos" root