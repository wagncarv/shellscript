#!bin/bash

# Script que realiza uma varredura da rede especificada, através do comando
# 'nmap' e mostra quais são os IP's que se encontram ativos, gravando em um arquivo
# 
# Autor: Felipe Prestes do Nascimento (a.k.a. ELE7R!X)

clear
echo "NetScan versão 0.3"
echo "...................................... by ELE7R!X" 
echo "-------------------------------------------------"
echo "======= DIGITE AS INFORMAÇÕES NECESSÁRIAS ======="
echo "-------------------------------------------------"

# Recebe as informacoes necessarias
echo "Se necessário, digite 'ajuda'."
echo
echo "Rede a ser pesquisada: [XXX.XXX.XXX.XXX] "
echo -n "--> "
read REDE
test "$REDE" = "ajuda" && echo && echo "Digite um IP válido dentro dessa rede." && echo "Ex.: 192.168.254.1 ou 201.1.5.3" && echo && echo -n "---> " && read REDE
echo
echo "Netmask: [/YY] "
echo -n "--> "
read NETMASK
test "$NETMASK" = "ajuda" && echo && echo "Digite o Netmask dessa rede." && echo "Ex.: /24 ou /16" && echo && echo -n "---> " && read NETMASK
echo
echo "Parâmetros:"
echo -n "--> "
read PARAMETROS
test "$PARAMETROS" = "ajuda" && echo && echo "Digite os parâmetros adicionais da pesquisa." && echo "Ex: -sP -A -O -sO" && echo && echo -n "---> " && read PARAMETROS
echo
echo "Salvar os resultados no arquivo: "
echo -n "--> "
read ARQUIVO
test "$ARQUIVO" = "ajuda" && echo && echo "Digite o nome do arquivo no qual será salvo o relatório." && echo "Ex.: relatorio.txt" && echo && echo -n "---> " && read ARQUIVO
test "$ARQUIVO" = "" && echo && echo "O relatório não será salvo."
echo

# Resumo dos dados
echo "-------------------------------------------------"
echo "==================== RESUMO ====================="
echo "-------------------------------------------------"
echo "--> Rede: $REDE$NETMASK"
echo "--> Parâmetros: $PARAMETROS"
echo "--> Nome do arquivo: $ARQUIVO"
echo "-------------------------------------------------"

# Pede confirmação antes de prosseguir e testa a validade da resposta

echo -n "Deseja continuar? [s/n]: "
read RESPOSTA

test "$RESPOSTA" = "n" && echo "Saindo..." && exit

test "$RESPOSTA" != "s" && echo "Resposta inválida... saindo..." && exit

# Grava o cabeçalho com informações quantitativas dos testes no arquivo temporário
echo "-------------------------------------------------" >> netscan.temp
echo >> netscan.temp
echo "NetScan versão 0.3 - [by ELE7R!X]" >> netscan.temp
echo 
echo "Rede varrida: $REDE$NETMASK" >> netscan.temp
echo >> netscan.temp

# Inicia os testes e grava no arquivo temporário

echo "Iniciando os testes..."
nmap $PARAMETROS $REDE$NETMASK >> netscan.temp
echo

# Confirmando a conclusão dos testes, gravando data, hora e encerrando no arquivo
# temporário

echo "Testes concluídos com sucesso!"
echo -n "Registrando data e hora dos testes..."
echo >> netscan.temp
LANG=pt_BR date >> netscan.temp
echo

# Exibindo resultados e gravando no arquivo escolhido

cat netscan.temp
test "$ARQUIVO" != "" && cat netscan.temp >> $ARQUIVO
rm netscan.temp
echo
echo "Concluído!"
echo
echo "Encerrando script..."
echo