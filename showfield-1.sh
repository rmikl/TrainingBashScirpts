#pisz skrypt showfield-1.sh, który wypisuje w kolejnych wierszach podane pole wskazanego pliku. Załóż, że domyślnie pola rozdzielone są spacją/tabulatorem. Nazwę pliku należy podać jako pierwszy argument wywołania skryptu, a numer pola – jako drugi. Opcja -d <separator> powoduje użycie jako separatora pól podanego znaku (znaków) zamiast spacji/tabulatora.
#
#Komenda systemowa: gawk (cut?)
#
#Przykładowe użycie i wynik działania skryptu:
#
#$./showfields-1.sh  fstab 1
# LABEL=slash
# /dev/system/swap
# LABEL=home
# /dev/sda2
# tmpfs
# devpts
# sysfs
# proc
# /dev/sdb1
# ...
#$ ./showfield-1.sh -d: /etc/group 1
#root
#bin
#daemon

#!/bin/bash

if [[ "$1" != -d* ]];then
	echo "inside fsdfd"
	cat $1 | tr -s ' ' | cut -d' '  -f $2
fi

toGetopts="false"
while getopts ":d:" opt;do 
	case $opt in
		d)	
			cut -d$OPTARG -f $3 $2
			toGetopts="true"
			;;
	esac
done

