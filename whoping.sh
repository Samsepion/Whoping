#!/bin/bash

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

figlet whoping
#Autor: Samsepion
echo -e "\n${turquoiseColour}-Autor: Samsepion\n${endColour}"
trap ctrl_c INT

function ctrl_c(){
        echo -e "\n${redColour}[!] Saliendo...\n${endColour}"
        tput cnorm; exit 1
}

echo -e "\n${greenColour}[*] Introduce la dirección ip a buscar:  \n${endColour}"
read ip 
echo " "
ttl=$(ping -c 1 $ip| grep ttl| awk '{print$6}'| sed 's/ttl=/ / '|xargs)    


if [ "$ttl" ]
then
    if (($ttl <= 64)); then > /dev/null 2>&1 
        echo  "Es Linux y tu ttl es de: "$ttl 
    elif (($ttl > 64 && $ttl <= 128)); then > /dev/null 2>&1 
        echo "Es Windows y tu ttl es de: "$ttl 
    else 
        echo "La maquina esta apagada"                 
    fi 

else
    echo "La maquina esta apagada"
fi



