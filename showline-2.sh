#pisz skrypt showline.sh-2, który wypisuje z danego pliku tekstowego (pierwszy argument) wiersz (lub wiersze), którego numer jest określony przez drugi argument (lub kolejne argumenty). Zadbaj, żeby zawartość pliku była czytana tylko jeden raz. Czy można zauważyć różnicę w szybkości działania skryptów showline-1.sh i showline-2.sh?
#/bin/bash

file="`cat -E $1`"

shift 

for i in $@; do 
	echo -E "$file" | head -n $i | tail -n 1 
done


	
