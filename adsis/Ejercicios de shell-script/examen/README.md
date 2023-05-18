# Septiembre de 2022

## Parte II (con apuntes)

## Ejercicio 1

La razon por la que hay que poner sudo en el script es porque para leer el fichero de /etc/shadow donde se encuentran las claves encriptadas, hay que ser super-usuario, en caso contrario no tendremos el permiso de leer el fichero. Además es posible que cambiemos la configuracion de una cuenta por ello tambien hay que ser administrador.