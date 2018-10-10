#pisz skrypt split2-2.sh, którego działanie jest rozszerzeniem działania skryptu spli2-1.sh. Opcja -h powoduje pustego wiersza i następującego komunikatu:
#
#Uzycie: split2.sh [ -h ] [ -s ] [ -1|2 ] <plik>
#Opcja -s powoduje zapisanie pierwszej połowy pliku do pliku o nazwie <nplik>-split2-1, a drugiej do pliku <nplik>-split2-2, gdzie <nplik> jest nazwą pliku z danymi z pominięciem ew. ścieżki do niego (oznacza to, że pliki muszą być zapisywane w bieżącym katalogu).
#
#Opcja -1 powoduje wypisanie zawartości wcześniej utworzonego pliku <nplik>-split2-1, Analogicznie działa opcja -2. Jeśli pliku nie ma to wyprowadzany jest komunikat:
#
#Plik <nplik>-split2-1 nie istnieje.
#i program kończy działanie.
#
#Jeśli zostaną użyte opcje -1|2 i -s, to tworzone są odpowiednie pliki i wypisywany jest jeden z nich.
#
#Komendy systemowe: basename head tail wc


#!/bin/bash

where=0

if [[ "$1" == "-h" ]];then
	echo "Uzycie: split2.sh [ -h ] [ -s ] [ -1|2 ] <plik>"
	exit 0
elif [[ "$1" == "-s" ]];then
	shift
	if [[ "$1" == "-1" ]];then
		shift
		where=1
	elif [[ "$1" == "-2" ]];then
		shift
		where=2
	else echo "zla opcja dla s"
		exit 1 
	fi
fi

count="`wc -l $1 | awk '{print $1}'`"
let secondHalf=$count/2

let firstHalf=$count-$secondHalf
#echo -e " count ma wartosc $count \n pierwsza polowa ma wartosc $firstHalf \n druga polowa ma wartosc $secondHalf "

if [[ "$where"  == "1" ]];then
	head -n $firstHalf $1 > pierwszaPolowa.test
elif [[ "$where" == "2" ]];then
	tail -n $secondHalf $1 > drugaPolowa.test
fi

