#!/bin/bash
echo starting connection
if [ -z "$1" ] || [ -z "$2" ]; then
echo 
echo -e "\e[1;34mlist of serial Ports:\e[0m"
echo 
dmesg | grep tty
read -p "Select Port:" PORT_SHORT
PORT=""/dev/"${PORT_SHORT}"
read -p "Select Baudrate:" BR;
else
PORT=$1
BR=$2

stty -F $PORT $BR -parity cs8 -cstopb
fi
echo -e "\e[1;34mConnected\e[0m"
echo -e "\e[1;34mConnected\e[0m" > $PORT
echo "" > $PORT
echo "" > $PORT

while :
do 
	echo -n -e "\e[1;34m$USER@USB:\e[0m" > $PORT
	echo -n -e "\e[1;32m$PWD\e[0m" > $PORT
    echo -n "-$ " > $PORT
	read INPUT < $PORT
    echo -e "\e[1;31m$INPUT\e[0m"
	echo $($INPUT)
	$INPUT > $PORT
done
