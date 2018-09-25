#Napisz skrypt selfpres-1.sh, który w kolejnych wierszach wypisuje: swoją nazwę, liczbę argumentów, wszystkie argumenty (parametry pozycyjne).
#
#Jeśli skrypt jest wywołany bez podania co najmniej 3 argumentów, to pojawia się komunikat: This script needs at least 3 command-line arguments! (wartość 3 jest określona przez odpowiednią zmienną) i skrypt kończy działanie.
#
#Wypisz wartości argumentów stosując instrukcje iteracyjne while, until, for.
#
#Komendy systemowe: basename
#
#Komendy basha: echo, for, if, set, shift, until, while
#
#Przykładowe wyniki działania skryptu:
#
#selfpres-1
#3
#Arguments may be printed using iterative instruction
#for ...
#x
#y
#z
#while [[ $# -gt 0 ]] ...
#x
#y
#z
#while (( $# > 0 )) ...
#x
#y
#z
#until ...
#x
#y
#z
#$./selfpres-1.sh x y
#selfpres-1
#2
#
#This  script needs at least 3 command-line arguments!



#!/bin/bash
count=0
array=("$@")


if [ "$#" -lt "3" ]; then
        echo "script needs to have at least 3 args"
else
        echo "WHILE LOOP"
        echo "============================"
        while [ "$count" -le "$#" ];do
                echo ${array[$count]}
                let count=$count+1
        done
        count=0


        echo "WHILE LOOP 2"
        echo "============================"
        while (( "$count" < "$#" ));do
                echo ${array[$count]}
                let count=$count+1
        done
        count=0
        echo -e "\n"
        echo "FOR LOOP"
        echo "============================"
        for i in $@; do
                echo $i
        done

fi
