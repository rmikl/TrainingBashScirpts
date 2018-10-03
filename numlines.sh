#pisz skrypt numlines, który dla podanego pliku tekstowego wypisuje jego zawartość numerując kolejne wiersze. Opcja -n <liczba> pozwala na zmianę numeru pierwszego wiersza z 1 na wskazaną liczbę. Jeśli plik nie istnieje lub nie jest plikiem tekstowym, to wyprowadzany jest stosowny komunikat.
#
#Przyładowe wyniki działania skryptu:
#
#$./numlines.sh -n 10 /etc/fstabb
#plik /etc/fstabb nie istnieje
#$./numlines.sh -n 10 /usr/bin/ls
#plik /usr/bin/ls nie jest plikiem tekstowym
#$ ./numlines.sh /etc/fstab
#1 :
#2 : #
#3 : # /etc/fstab
#4 : # Created by anaconda on Wed Feb 19 19:35:31 2014
#5 : #
#6 : # Accessible filesystems, by reference, are maintained under '/dev/disk'
#7 : # See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#8 : #
#$ ./numlines.sh -n 10 /etc/fstab
#10 :
#11 : #
#12 : # /etc/fstab
#13 : # Created by anaconda on Wed Feb 19 19:35:31 2014
#14 : #
#15 : # Accessible filesystems, by reference, are maintained under '/dev/disk'
#16 : # See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info

#!/bin/bash

firstLine=1

while getopts ":n:" opt;do
	case $opt in
	n) firstLine=$OPTARG
	shift ;shift
	;;
	:) echo "opcja $OPTARG wymaga argumentu "
	exit 1
	;;
	esac 
done

		


if ! [[ -f "$1" ]];then
	echo "plik nie istnieje"
	exit 1
elif [[ "`file $1 | grep text | wc -l`" == "0" ]];then
	echo "podany plik nie jest plikiem textowym"
	exit 1
fi

nl -v $firstLine $1
