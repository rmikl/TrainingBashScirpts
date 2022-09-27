#!/bin/bash 


while (true);do date +"%Y-%m-%d_%T" | tr -d "\n"; printf " "; speedtest-cli --secure --simple | awk '{print $2
,$3," "}' | tr -d "\n"; echo;sleep 30;done 
