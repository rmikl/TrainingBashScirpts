#Napisz skrypt popts.sh, którego działanie jest sterowane opcjami a, b, c oraz X, Y, Z, zakładając, że opcje X, Y i Z przyjmują pewne wartości. Skrypt w oddzielnych wierszach wypisuje kolejno opcje (w kolejności alfabetycznej) wraz z ew. ich wartościami (wg podanej kolejności), wszystkie argumenty (wg kolejności występowania), których liczba nie jest z góry określona, liczbę opcji każdego rodzaju oraz liczbę argumentów.
#
#Przyładowe wyniki działania skryptu:
#
#$ ./popts.sh -ab -Y 123 -Z 345  1 2 3
#opcja a
#opcja b
#opcja Y=123
#opcja Z=345
#argumenty         = 1 2 3
#liczba opcji      =  2 2
#liczba argumentow =  3
#$ ./popts.sh -x 1 2 3
#opcja nieprawidlowa: -x
#$ ./popts.sh -X
#opcja -X wymaga argumentu
#

smalOptCount=0
capitalOptCount=0

#!/bin/bash 

while getopts ":abc :X:Y:Z:" opt; do
	case $opt in
	a) 	echo "opcja a"
		let smalOptCount=$smalOptCount+1
		;;
	b) 	echo "opcja b"
		let smalOptCount=$smalOptCount+1
		;;
	c) 	echo "opcja c"
		let smalOptCount=$smalOptCount+1
		;;
	X) 	echo "opcja X=$OPTARG"
		let capitalOptCount=$capitalOptCount+1
		;;
	Y) 	echo "opcja Y=$OPTARG"
		let capitalOptCount=$capitalOptCount+1
		;;
	Z) 	echo "opcja Z=$OPTARG"
		let capitalOptCount=$capitalOptCount+1
		;;
	:)	echo "opcja -$OPTARG wymaga argumantu"
		exit 1 
		;;
	\?)	echo "opcja -$OPTARG jest nieprawidlowa "
		exit 1
		;;
	esac
done

for i in $@; do 
	if [[ "$i" == -a* ]] || [[ "$i" == -b* ]] || [[ "$i" == -c* ]];then
		shift
	fi
	if [[ "$i" == -X* ]] || [[ "$i" == -Y* ]] || [[ "$i" == -Z* ]]; then
		shift 
		shift
	fi
done


echo -E  "argumenty = "$@
echo -E "liczba opcji : $smalOptCount $capitalOptCount"
echo -E "licba argumentow : $#"
