#!/bin/bash

if date | grep qui > /dev/null
then
    echo "Hoje é quinta-feira"
elif date | grep qua > /dev/null
then
    echo "Hoje é quarta-feira"
elif date | grep dom > /dev/null
then
    echo "Hoje é domingo"
else
    echo "Não sei que dia é hoje"
fi