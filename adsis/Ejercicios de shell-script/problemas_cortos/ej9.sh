#!/bin/bash

while read shell
do  
    echo "SHELL: $shell"
    while read user
    do
        echo "$user"
    done < <(grep "$shell" /etc/passwd | cut -d':' -f1)
    
done < <(cut -d':' -f7 /etc/passwd | sort | uniq)