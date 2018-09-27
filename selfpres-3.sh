#elfpres-3¶
#Napisz skrypt selfpres-3.sh, który do poprawnego działania potrzebuje trzech argumentów. Jeśli któregoś z argumentów brakuje, to nadawane im są domyślne wartości p1, p2 oraz p3. Domyślne działanie skryptu jest takie, że podanie jako argumentu ‘’ (pustego znaku) powoduje nadanie argumentowi domyślnej wartości (pierwszemu p1, itd). Opcja -b powoduje, że argumentowi drugiemu lub trzeciemu można nadać wartość ‘’.
#
#Patrz http://devmanual.gentoo.org/tools-reference/bash/index.html.
#
#Przykładowe wyniki działania skryptu:
#
#$./selfpres-3.sh
#==p1==
#==p2==
#==p3==
#$./selfpres-3.sh x
#==x==
#==p2==
#==p3==
#$./selfpres-3.sh x ''
#==x==
#==p2==
#==p3==
#$./selfpres-3.sh -b x ''
#==x==
#====
#==p3==
#$./selfpres-3.sh -b x '' ''
#==x==
#====
#====


#/bin/bash 

b="false"
p1="p1"
p2="p2"
p3="p3"


if [[ ${1} == "-b" ]];then 
	b="true"
	shift
	#echo "ilosc argumentow $#"
fi

#echo "wartosc b $b"


if [[ "${b}" == "true" ]];then
	if [[ -z "${1}" ]];then
		p1=''
	else p1=$1
	fi
	if [[ -z "${2}" ]];then
		p2=''
	else p2=$2
	fi	
	if [[ -z "${3}" ]];then
		p3=''
	else p3=$3
	fi
elif [[ "${b}" == "false" ]];then
	if [[ -z "${1}" ]];then
		p1="p1"
	else p1=$1
	fi
	if [[ -z "${2}" ]];then
		p2="p2"
	else p2=$2
	fi
	if [[ -z "${3}" ]];then
		p3="p3"
	else p3=$3
	fi
fi
if [[ $# == "1" ]];then
	p2="p2"
	p3="p3"
elif [[ $# == "2" ]];then
	p3="p3"
fi

echo "==$p1=="
echo "==$p2=="
echo "==$p3=="

