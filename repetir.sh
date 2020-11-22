#!/bin/bash

if [ $# = 0 ]; then
    echo "Você não informou site algum"
else
    echo $* | sed 's/ /\n/g' > sites.txt

    for i in $(cat sites.txt);do
        ping -c1 $i
    done

    echo "Você informou $# sites"
fi

