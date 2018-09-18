##Zad. 2. showargs-2¶
#Napisz skrypt showargs-1.sh, który wypisuje w pierwszym wierszu liczbę argumentów, a w kolejnych osobnych wierszach kolejne argumenty. Jeśli pierwszym argumentem jest -r, to argumenty są wypisywane w odwrotnej kolejności (pierwszy argument, czyli w tym przypadku opcję należy pominąć). W celu wypisania argumentów w odwrotnym porządku zapisz je najpierw do tablicy.

#Przykłady użycia skryptu:

#./showargs-1.sh a b c d
#4
#a
#b
#c
#d


#./showargs-1.sh -r 1 2 3
#3
#3
#2
#1


#!/bin/bash
let tableCount=$#-1
array=( "$@" )


if [[ "$1" == "-r" ]];then
	echo $tableCount	
	for (( i=$# ; i>=1 ; i-- )); do
		echo ${array[i]}
	done		
else
	echo $#
	for i in $@ ; do 
		echo $i
	done
fi
