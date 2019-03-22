#!/bin/bash

if [[ ! -f /var/isabelle/built_flag ]];
then
    if [[ $(whoami) != "root" ]];
    then
        echo "Run this for the first time with 'sudo' to permit building."
        exit 1
    else
        mkdir -p /var/isabelle
        touch /var/isabelle/built_flag
    fi
fi

