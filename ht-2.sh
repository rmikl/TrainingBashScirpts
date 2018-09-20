#Napisz skrypt ht-2.sh, który pobiera poprzez argumenty nazwy plików tekstowych, a następnie wypisuje pierwszych i ostatnich 10 wierszy każdego z nich. Jeśli plik nie jest typu ‘text’, to wyprowadzany jest stosowny komunikat.
#
#Komendy systemowe: grep file head tail
#
#Przykładowe wyniki działania skryptu:
#
#$ ./ht-2.sh /etc/hosts
#plik /etc/hosts: HEAD
#         --------------------------------
#127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
#::1         localhost6 localhost6.localdomain6
#158.75.1.113    hpc-admin
#158.75.5.2      scobie.fizyka.umk.pl  scobie
#192.168.254.1   dummy0 dummy0.localdomain
#158.75.4.237    host-4-237.fizyka.umk.pl host-4-237     s237
#158.75.5.43     ameryk.fizyka.umk.pl    ameryk  am
#158.75.5.47     uran.fizyka.umk.pl      uran    u
#158.75.5.51     tal.fizyka.umk.pl       tal tl
#158.75.5.52     host5-52.fizyka.umk.pl  ig
#
#plik /etc/hosts: TAIL
#--------------------------------
##
#fe80::215:c5ff:feb1:9a8a scobie6ll
#fe80::214:22ff:fec8:e892 scobie6610ll
#
#2002:9e4b:5fe:0:215:c5ff:feb1:9a8a scobie6
#2002:9e4b:5fe:0:214:22ff:fec8:e892 scobie6610
##
#81.190.16.5 shelly michal
#
#10.0.0.1  folavirt.lan folavirt
#=======================================================================
#$ ./ht-2.sh  /bin/ls
#/bin/ls is not a text file ... skipping ...
#=======================================================================

#!/bin/bash



for i in $@; do
	if [[ `file $i | grep text | wc -l` == '0' ]];
		then echo "file is not text file"; 
	else
		echo "zawartosc pliku : " $i
		echo "HEAD __________________________"	;	
		head $i; 
		echo "TAIL __________________________";
		tail $i; 
 
	fi
done

