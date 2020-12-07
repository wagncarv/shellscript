#!/bin/bash

faz_ping(){
    ping -c1 $1 2> /dev/null
}

echo "Digite um site:"
read site
faz_ping "$site"
# sleep 3
# clear