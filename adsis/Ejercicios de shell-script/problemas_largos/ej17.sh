#!/bin/bash

while read -r linea
do
    disp=$(echo "$linea" | awk '{print $1;}')
    mont=$(echo "$linea" | awk '{print $2;}')

    if ! grep "$disp $mont " /etc/fstab
    then
        echo "$disp,$mont" >> /tmp/pt_mont
    fi
done < <(cat /etc/mtab | egrep -v "(sysfs|tmpfs|securityfs|debugfs|proc)")

if [ -s /tmp/pt_mont ]
then
    cat /tmp/pt_mont | mail -s "nuevos puntos de montaje" root
    rm /tmp/pt_mont
fi

exit 0