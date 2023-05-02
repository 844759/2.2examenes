#!/bin/bash
# En cierta asignatura, los estudiantes deben realizar una página web. Todos los matriculados tienen 
# cuenta en la máquina, aunque algunos nunca han llegado a abrir una sesión. A estos los llamaremos 
# usuarios inactivos. Se desea hacer un script bash que haga una copia de la web de todos los usuarios 
# activos, que borre la cuenta de los usuarios inactivos y que muestre un pequeño informe de lo que está 
# haciendo. 

dir="passwd.txt"

grep '/home/al-03-04' $dir

while read linea
do

    
done < <(grep '/home/al-03-04' $dir)