#!/bin/bash

if [`whoami`= `root`]
then
	echo "Eu sou root"
else
	echo "Não sou nada"
fi