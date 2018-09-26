#Napisz skrypt selfpres-2.sh, który przyjmuje dokładnie 3 argumenty. Jeśli skrypt jest uruchamiany bez żadnego argumentu, z jednym lub dwoma argumentami, to kończy się wypisując odpowiedni komunikat i zwracając odpowiednio status powrotu (kod błędu) 3, 2 lub 1.
#
#Komendy systemowe: basename
#
#Komendy basha: echo, if
#
#Przykładowe wyniki działania skryptu:
#
#$./selfpres-2.sh x y z
#All three positional parameters given: x y z. Exiting with error code 0.
#$./selfpres-2.sh x y
#Missing $3. Exiting with error code 1.
#$./selfpres-2.sh x
#Missing $2 and $3. Exiting with error code 2.
#$./selfpres-2.sh
#Missing $1, $2 and $3. Exiting with error code 3.


#!/bin/bash 

if (( $# == "3" )); then
	echo "All three positional parameters given: x y z. Exiting with error code 0."
elif (( $# == "2" )); then
	echo 'Missing $3. Exiting with error code 1.'
elif (( $# == "1")); then
	echo 'Missing $2 and $3. Exiting with error code 2.'
else
	echo "wrong number of args please give proper amount"
fi
