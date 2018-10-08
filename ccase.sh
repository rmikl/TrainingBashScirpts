#pisz skrypt ccase.sh, który pobiera dowolną liczbę argumentów i w każdym zamienia duże litery na małe. Opcja -r powoduje zamianę małych liter na duże.
#
#Komenda systemowa: tr (stosując tę komendę trzeba pamiętać o umieszczaniu jej argumentów w apostrofach)
#
#Przykładowe wyniki działania skryptu:
#
#$./ccase-1.sh  AB CD eF xx YY
#ab cd ef xx yy
#$./ccase-1.sh -r AB CD eF xx YY
#AB CD EF XX YY

#!/bin/bash 

if [[ "$1" == "-r" ]]; then 
	shift
	for i in $@; do
		printf "$i "
	done  | tr A-Z a-z
		printf "\n"
else 
	for i in $@; do 
		printf "$i " 
	done | tr a-z A-Z
		printf "\n"
fi
