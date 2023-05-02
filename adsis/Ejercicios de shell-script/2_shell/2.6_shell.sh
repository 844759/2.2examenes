#!/bin/bash
# Hacer un shell script con funciones matemáticas, debe tener un factorial calculado de 
# forma iterativa, un factorial calculado de forma recursiva, y una función que imprima la 
# serie de fibonacci. 

factorial_recursivo(){
    if [ $1 -eq 0 ]; then
        echo 1
    else
        num=$(($1 - 1))
        aux=$(factorial_recursivo $num)
        res=$(($aux * $1))
        echo $res

        #echo $(($1 * $(factorial_recursivo $(($1 - 1)))))
    fi
}

factorial_iterativo(){

    i=$1
    factorial=1
    while [ $i -ne 0 ]
    do
        factorial=$((factorial*i))
        i=$((i-1))
    done
    factorial=$((factorial*1))
    echo $factorial

}

fibonacci(){

    n=0
    if [ $1 -eq 0 ]
    then
        n=0
    elif [ $1 -eq 1 ]
    then
        n=1
    else

        n1=0
        n2=1
        i=2
        while [ $i -le $1 ]
        do
            n=$(($n1 + $n2))
            n1=$n2
            n2=$n
            i=$((i+1))
        done
        
    fi

    echo $n
}

resultado=$(factorial_recursivo $1)
echo "El resultado es $resultado"

resultado=$(factorial_iterativo $1)
echo "El resultado es $resultado"

resultado=$(fibonacci $1)
echo "El resultado es $resultado"