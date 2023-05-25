#!/bin/bash

for ip in 192.168.4.{1..255}
do
    oldIFS=$IFS
    IFS=' '
    while read -r name dns
    do
        if grep -q "$dns" /tmp/dns
        then
            echo "$name $dns" >> /tmp/dns
        fi

    done < <(ssh as@$ip "cat /etc/resolv.conf")
    IFS=$oldIFS
done

min=99
while read -r name dns
do

    time=$(dig @$dns www.unizar.es | grep "Query time" | awk '{print $4;}')
    if [ $min -gt $time ]
    then
        min=$time
        dns_min=$dns
        dns_name=$name
    fi

done < <(cat /tmp/dns)

for ip in 192.168.4.{1..255}
do

    if ! ssh as@$ip "cat /etc/resolv.conf | grep -q $dns_min"
    then

        ssh as@$ip "echo "actualize su dns a $dns_min" | mail -s "servidor dns" root"

    fi

done