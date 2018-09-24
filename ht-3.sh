#pisz skrypt ht-3.sh, który jest rozszerzeniem skryptu ht-2.sh o możliwość określania liczby wypisywanych wierszy. Opcje -t <liczba> i -b <liczba> określają odpowiednio liczbę pierwszych i ostatnich wierszy, które będą wyprowadzane na standardowe wyjście.
#
#Komendy systemowe: grep head tail
#
#Przykładowy wynik działania skryptu:
#
#$ ./ht-3.sh -t1 -b1 /etc/hosts /etc/services
#plik /etc/hosts: HEAD
#--------------------------------
#127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
#
#plik /etc/hosts: TAIL
#--------------------------------
#10.0.0.1  folavirt.lan folavirt
#=======================================================================
#
#plik /etc/services: HEAD
#--------------------------------
## /etc/services:
#
#plik /etc/services: TAIL
#--------------------------------
#matahari        49000/tcp               # Matahari Broker
#=======================================================================
#!/bin/bash

T=10
B=10
count=0


while getopts ":t::b:" opt;do
	case $opt in
		t) T=$OPTARG
		let count=$count+1		
		echo "inside t"
		;;
		b) B=$OPTARG
		let count=$count+1
		shift
		echo "inside b"
		;;
		\?)echo "opcja niezdefiniowana"
		;;
		:) echo "opcja -$OPTARG wymaga argumentu"
		;;
	esac
done
#echo "count before if"$count
#echo "count number of elements in array" $#
if (( $count == "0" )) ;then echo  
else
	for i in 0; do shift; echo "did smth"; done
fi
#echo $@
for i in $@ ; do
	echo -e "plik $i\n"
	echo "head__________________"
	head -n $T $i
	echo "tail__________________"
	tail -n $B $i
	echo -e "\n\n"
done



