#pisz skrypt showline.sh-1, który wypisuje z danego pliku tekstowego (pierwszy argument) wiersz (lub wiersze), którego numer jest określony przez drugi argument (lub kolejne argumenty). Jeśli zostanie użyta opcja -r, to skrypt wyświetla podany wiersz, ale jego numer jest liczony od końca pliku.
#
#Komendy systemowe: head tail
#!/bin/bash 
line=0

if [[ "${1}" == "-r" ]];then
	shift
	line=$1
	shift 
	for i in $@; do
		tail -n $line $i | head -n 1
	done
else	
	line=$1
	shift
	for i in $@;do
		head -n $line $i | tail -n 1 
	done 
fi
