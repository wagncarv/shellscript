#!/bin/bash

if [ -z $1 ]
    then
        echo "Informe o parâmetro"
        echo ""
        echo "Este script executa ping para alvos passados por parâmetro"
        echo "Ex.: ./ping.sh www.google.com"
        echo ""
    else
        echo "O site informado foi: $1"
        ping -c1 $1 > /dev/null
fi