#pisz skrypt split2-1.sh, który dzieli podany plik tekstowy na dwie części zawierające po połowie wierszy oryginalnego pliku. Skrypt wyprowadza na standardowe wyjście najpierw pierwszych n/2 wierszy, następnie wiersz pusty, a potem pozostałe wiersze. Jeśli liczba wierszy jest nieparzysta, to druga z części zawiera ich nieparzystą liczbę.
#
#Czy można uprościć działanie skryptu wykorzystując komendę split?
#
#Komendy systemowe: head tail wc
#
#Przykładowy wynik działania skryptu:
#
#$ ./split2.sh dane/passwd-split2-2
#root::x::0::0::System Administrator::/root::
#bin::x::1::1::bin::/bin::
#
#daemon::x::2::2::daemon::/sbin::
#adm::x::3::4::adm::/var/adm::
#rpc:x:32:32:Portmapper RPC user:/:/sbin/nologin


#!/bin/bash

if ! [[ -f "$1" ]];then
	echo "podaj pliku o formacie tekstowym"
	exit 1 
fi

count="`wc -l $1 | awk '{print $1}'`"
let secondHalf=$count/2

let firstHalf=$count-$secondHalf
#echo -e " count ma wartosc $count \n pierwsza polowa ma wartosc $firstHalf \n druga polowa ma wartosc $secondHalf "

head -n $firstHalf $1
echo ""
tail -n $secondHalf $1
