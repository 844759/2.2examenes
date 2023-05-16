#!/bin/bash
re='\.txt$'
for file in ./*
do
    if [ $file =~ "$re" ]
    then
        echo "Match found: $file"
    fi
done