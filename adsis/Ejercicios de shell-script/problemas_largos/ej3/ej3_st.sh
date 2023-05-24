#!/bin/bash
# Script activacion de servidor apache2 y configuracion de IPTables

# Limpiamos reglas existentes
iptables -F
iptables -t nat -F
iptables -t mangle -F

# Politicas por defecto
iptables -P INPUT DROP
iptables -P FORWARD DROP

# Bloqueamos peticiones apache 2
iptables -A INPUT -p tcp --dport 80 -j DROP

service apache2 stop
