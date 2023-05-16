#!/bin/bash

f() {
    if [ -t 0 ]; then
        echo "$1"
    else
        read var
        echo "$var"
    fi
}

f 'hello' | f
echo "$var"