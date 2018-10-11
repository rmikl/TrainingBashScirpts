#napisz skrypt system-1.sh, który wypisuje kwalifikowaną nazwę hosta, w nawiasie jego adres IP, nazwę dystrybucji i numer wydania, architekturę systemu, rodzaj i wersję używanego systemu operacyjnego.
#
#Przykładowy wynik działania skryptu:

#$ ./system-1.sh
#  Host: uran.fizyka.umk.pl (158.75.5.68)
#  Nazwa dystrybucji i numer wydania: CentOS release 5.5 (Final)
#  Architektura systemu: i686
#  Rodzaj i wersja systemu operacyjnego: Linux 2.6.18-prep
#Komendy systemowe: cat, domainname, gawk, grep, head, hostname, uname
#
#Pliki: /etc/issue
#
#!/bin/bash

echo "Host: echo `dnsdomainname` `dnsdomainname -i`"
echo "Nazwa dystrybucji i numer wydania: `cat /etc/redhat-release`"
echo "Architektura systemu: `uname --proc`"
echo "Rodzaj i wersja systemu operacyjnego: `uname -r`"

