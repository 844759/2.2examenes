#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Numero incorrecto de parametros"
    exit 1
fi

user_dir=$( cat /etc/passwd | grep "$1" | cut -d':' -f6)

cd $user_dir

while read dir
do

    if [ -d "$dir" ]
    then
        echo ""$dir" es un directorio valido"
    fi

done < <(cat ""$user_dir"/.bash_history" | grep "cd" | sed -r 's/ +/ /g' | cut -d' ' -f2 | grep -E "^(/|~+|~)")