# Ejercicios_1 de shell

## Expresiones Regulares

1. Sustituya todas las ocurrencias de “No” por “XX”.

   sed -r 's/No/XX/g' shell_script_ejercicios_1

2. Inserte “>>” al principio de cada línea de un texto.

   sed -r 's/^()/>>/' shell_script_ejercicios_1

3. Elimine los dos últimos caracteres de cada línea.

   sed -r 's/..$//' shell_script_ejercicios_1

4. Elimine la extensión de un archivo (ejm: foo.txt → foo).

   sed -r 's/\.[a-z]*//g' shell_script_ejercicios_1

5. Elimine todas las vocales de un texto.

   sed -r 's/(a|e|i|o|u)/ /g' shell_script_ejercicios_1

6. Sustituya las letras mayúsculas por *.

   sed -r 's/[A-Z]/*./g' shell_script_ejercicios_1

7. Sustituya los espacios seguidos por un sólo espacio (ejm: foo    bar fooz → foo bar fooz)

   sed -r 's/  */ /g' shell_script_ejercicios_1

8. Elimine los 10 primeros caracteres de cada línea.

   sed 's/^.\{10\}//' shell_script_ejercicios_1

9. Encuentre un número de teléfono en un texto, donde el teléfono puede ser con los formatos:
   689 123 456 ó 689-123-456. Teniendo en cuenta que tiene que ser la misma expresión 
   regular para los dos telefónicos, y que el primer dígito debe ser 6, 7 , 8 o 9.

   sed -n '/\(6\|7\|8\|9\)[0-9]\{2\}\([- ]\)\?[0-9]\{3\}\([- ]\)\?[0-9]\{3\}/p' shell_script_ejercicios_1

## Ejercicios de tools

1. Buscar en /etc/passwd usuarios del sistemas con id > 99

   grep -E '^[^:]*:[^:]*:([1-9][0-9][0-9]+):' /etc/passwd | cut -d: -f1

   Donde [^:]* significa concatenacion de cualquier caracter que no sea :, basicamente para pillar cualquier caracter que hay delante, despues se pone
   ([1-9][0-9][0-9]+), para pillar numeros mayores que 99, es decir 100-... , donde el + indica que se elige un digito de 0-9 una o más veces para coger numeros
   por encima de 999 e infinito. El comando cut simplemente muestra el nombre del usuario solo utilizando : como delimitador de la salida.

2. Ordenar los usuarios del apartado 1 por id.

   sort -t: -nk3 /etc/passwd | grep -E '^[^:]*:[^:]*:([1-9][0-9][0-9]+):' | cut -d: -f1 

   Se utiliza el comando sort para ordenar el fichero /etc/passwd utilizando -t para seleccionar el delimitador : y nk3, para especificar con n
   que se ordena numericamente y k3 la tercera columna del fichero /etc/passwd que contiene el id.


## Aclaraciones 
   - Si pones el flag g, es posible que las repeticiones del estilo .\{5,\} o a\{5\} no puedan funcionar



