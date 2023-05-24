#!/bin/bash
# Script activacion de servidor apache2 y configuracion de IPtables

iptables -F

service apache2 start
