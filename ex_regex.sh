#!/bin/bash

grep -Eo '([ A-Za-z-]|[0-9]){1,15}\ \([0-9]{1,5}\)\ [ :A-Za-z-]*' Exp_reg.txt

echo " "
echo "Fim ex_regex.sh"