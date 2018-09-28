#pisz skrypt showline.sh-1, który wypisuje z danego pliku tekstowego (pierwszy argument) wiersz (lub wiersze), którego numer jest określony przez drugi argument (lub kolejne argumenty). Jeśli zostanie użyta opcja -r, to skrypt wyświetla podany wiersz, ale jego numer jest liczony od końca pliku.
#
#Komendy systemowe: head tail
#!/bin/bash 

if [[ "${1}" == "-r" ]];then 
	tail -n $2 $3 | head -n 1
else	
	head -n $1 $2 | tail -n 1 
fi
