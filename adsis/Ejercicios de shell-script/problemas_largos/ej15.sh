#!/bin/bash

# Asegurarse de que se proporcionan los argumentos correctos
if [ $# -ne 2 ] || [ ! -f $1 ] || [ ! $(id -u $2 2>/dev/null) ] 
then
  echo "Parámetros inválidos"
  exit 85
fi

file=$1
user_dest=$2
user_orig=$(whoami)
key_file="/var/keys/${user_orig}_${user_dest}.key"
group="${user_orig}_${user_dest}"

# Crear la clave si no existe
if [ ! -f $key_file ]; then
  mkdir -p /var/keys
  head -c 128 /dev/urandom > $key_file
  chown $user_orig:$group $key_file
  chmod 440 $key_file
fi

# Crear el grupo si no existe
if ! getent group $group > /dev/null; then
  groupadd $group
fi

# Asegurarse de que el usuario de destino esté en el grupo
if ! groups $user_dest | grep &>/dev/null "\b$group\b"; then
  usermod -aG $group $user_dest
fi

# Encriptar el archivo
enc_file="${file}.enc"
openssl enc -aes-128-cbc -pass file:$key_file -a -in $file -out $enc_file

# Establecer los permisos del archivo
chown $user_orig:$group $enc_file
chmod 440 $enc_file
