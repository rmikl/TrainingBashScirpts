#Napisz skrypt ht-1.sh, który pobiera poprzez argumenty nazwy plików tekstowych, a następnie wypisuje pierwszych 10 wierszy każdego z nich.
#
#Komendy systemowe: head
#
#Przykładowy wynik działania skryptu:
#
#$ ./ht-1.sh /etc/hosts /etc/services
#
#plik /etc/hosts
#--------------------------------
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
#plik /etc/services
#--------------------------------
# /etc/services:
# $Id: services,v 1.55 2013/04/14 ovasik Exp $
#
# Network services, Internet style
# IANA services version: last updated 2013-04-10
#
# Note that it is presently the policy of IANA to assign a single well-known
# port number for both TCP and UDP; hence, most entries here have two entries
# even if the protocol doesn't support UDP operations.
# Updated from RFC 1700, ``Assigned Numbers'' (October 1994).  Not all ports



#/bin/bash 



for i in $@; do
	head $i
done
