#!/bin/bash

ping -c1 $1 2>$1 >> ping.txt
echo "Você digitou $# sites"