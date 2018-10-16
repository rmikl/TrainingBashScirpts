#napisz skrypt system-2.sh, który jest rozszerzeniem skryptu system-1.sh. Oprócz danych o systemie wypisywanych przez skrypt system-1.sh podaje on model procesora, liczbę procesorów, dostępną pamieć RAM oraz pamięć wymiany (w KB oraz GB).
#
#Przykładowy wynik działania skryptu:
#
#$ ./system-2.sh
#  Host: uran.fizyka.umk.pl (158.75.5.68)
#  Nazwa dystrybucji i numer wydania: CentOS release 5.5 (Final)
#  Architektura systemu: i686
#  Rodzaj i wersja systemu operacyjnego: Linux 2.6.18-prep
#  Model procesora: Intel(R) Xeon(TM) CPU 3.06GHz
#  Liczba procesorow: 4
#  Pamiec RAM w KB (GB): 3354268 (3.1988)
#  Pamiec wymiany w KB (GB): 2047996 (1.9531)
#Komendy systemowe: bc, cat, domainname, gawk, free, grep, head, hostname, uname
#
#Pliki: /etc/issue, /proc/cpuinfo, /proc/meminfo

#!/bin/bash 


RAM="`cat /proc/meminfo | grep MemAvailable | awk '{print $2}'`"
SWAP="`cat /proc/meminfo | grep SwapTotal | awk '{print $2}'`"
echo "Host: echo `dnsdomainname` `dnsdomainname -i`"
echo "Nazwa dystrybucji i numer wydania: `cat /etc/redhat-release`"
echo "Architektura systemu: `uname --proc`"
echo "Rodzaj i wersja systemu operacyjnego: `uname -r`"
echo "Model Procesora:`cat /proc/cpuinfo  | grep 'model name' | awk -F:   '{print $2}'`"
echo "Liczba Procesorow:`cat /proc/cpuinfo  | grep 'cpu cores' | awk -F:  '{print $2}'`"
echo "Pamiec RAM w KB (GB): $RAM (0`echo "scale=7; $RAM / (1024*1024)" | bc`)"
echo "Pamiec wymiany w KB (GB): $SWAP (`echo "scale=7; $SWAP /(1024*1024)" | bc `)"

