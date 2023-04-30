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

3. Dado un fichero con nombres y otro con apellidos, unir los dos ficheros y dejar sólo una de 
   las personas con apellido repetido, mostrando cuantas personas de cada familia hay. 

   paste -d' ' nombres apellidos | sort -k2 | uniq -f1 -c

   Se utiliza el comando paste para unir los dos archivos, seleccionando como delimitador un espacio con -d' ', posteriormente se usa el comando sort
   para ordenar por la segunda columna -k2, es decir, por apellidos y por ultimo con unique simplemente se cuenta las lineas con el mismo apellido
   con -f1 no se cuenta el nombre, es decir si tienen distinto nombre no se tiene en cuenta.

4. Eliminar las lineas vacías de un texto. 

   grep -v '^$' shell_script_ejercicios_1 > shell_script_ejercicios_1

   Se utiliza grep para recoger solo las lineas que no coinciden con la expresion regular, es decir que no sean lineas vacias,
   para posteriormete guardar la salida al mismo archivo.

5. Extraer hora y minuto de la fecha: 11:26

   date | cut -d' ' -f5 | cut -d: -f1,2

   Se utiliza el comando date para obtener la fecha actual, posteriormente se usa cut dos veces, una para elegir el dato de la columna que nos interesa
   y despues para seleccionar en ella la hora y los minutos.

6. Formatear la fecha con la forma: abr 11, 2013

   date | cut -d" " -f2,3,4 | sed 's/\(.\{2\}\) \(.\{3\}\) \(.\{4\}\)/\2 \1, \3/'

   Se utiliza el comando date para obtener la fecha, posteriormente usamos cut para obtener aquellas columnas que nos interesan, y por ultimo usamos sed
   para agrupar las expresiones regulares y reordenarlas.


## Aclaraciones 
   - Si pones el flag g, es posible que las repeticiones del estilo .\{5,\} o a\{5\} no puedan funcionar



