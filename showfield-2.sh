#Napisz skrypt showfield-2.sh, który wypisuje w kolejnych wierszach podane pole lub pola wskazanego pliku. Załóż, że domyślnie pola rozdzielone są spacją/tabulatorem. Nazwę pliku należy podać jako pierwszy argument wywołania skryptu, a numer pola – jako drugi lub ew. kolejne argumenty. Opcja -d <separator> powoduje użycie jako separatora pól podanego znaku (lub znaków) zamiast spacji/tabulatora.
#
#Komenda systemowa: gawk (cut?)
#
#Przykładowe użycie i wynik działania skryptu:
#
#./showfield-2.sh  -d: /etc/passwd 1 3 5
#torrent : 100 : BitTorrent Seed/Tracker
#postgrey : 101 :
#ntop : 102 : ntop user
#...
#./showfield-2.sh -d: /etc/group 1 2
#root : x
#bin : x
#daemon : x
#sys : x
#...
#./showfield-2.sh -d:: /etc/hosts 2
#1         localhost6 localhost6.localdomain6
#215:c5ff:feb1:9a8a scobie6ll
#214:22ff:fec8:e892 scobie6610ll
#...



#!/bin/bash 

if [[ "$1" != -d* ]];then
	filename=$1
	echo "insideif"
	shift
	newArray="`echo $@ | awk -v OFS="," '{$1=$1;print}'`"
	cat $filename | tr -s ' ' | cut -d" " -f $newArray 
fi


while getopts ":d:" opt;do 
	case $opt in
		d)				
			filename=$2
			shift 
			shift
			newArray="`echo $@ | awk -v OFS="," '{$1=$1;print}'`"
			cut -d$OPTARG -f $newArray $filename  
			;;
	esac
done

