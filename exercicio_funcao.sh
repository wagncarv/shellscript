#!/bin/bash

ip(){
    pinh -c1 $site | sed -n '2p' | grep -Eo '\(.+\)' | grep -Eo '[a-z0-9:.]+'
}

cnpj(){
    whois $site | grep -Eo '[0-9]{2}\.[0-9]{3}\.[0-9]{4}\-[0-9]{2}'
}

redirect(){
    wget -b -p $site
    sleep 3
    grep -Eo 'href\=\"https?\:\/\/w{3}\..*\..{2,3}"' $site/index.* | cut -d"\" -f2 | grep -E 'https?'
}

while true;do:
echo "Digite site alvo: "
read site
echo " "
echo "Digite: "
echo "1 - Para obter IP do alvo"
echo "2 - Para descobrir o CNPJ do alvo"
echo "3 - Para listar os redirecionamentos externos"
read opcao

case $opcao in
    1) ip
        ;;
    2) cnpj
        ;;
    3) redirect
        ;;
    *) echo "Consulta inválida"
        ;;
esac
done

exit