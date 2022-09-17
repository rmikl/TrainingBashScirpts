#!/bin/bash 

if [[ "$1" == "-h" ]];then 
	echo "Script will rotate log files in format type.log and 'type.log.x' it will increase x and create new log file"
	exit
fi
for i in $(seq 100 1)
do 
	CURRENT_FILE=$(find . -maxdepth 1 -iname "*.$i")
	for l in $CURRENT_FILE;
		do
			LOG_NUMBER=$(echo $l | awk -F "." '{print $NF}')
			let "NEW_LOG_NUMBER = $LOG_NUMBER + 1"
			FILE_NAME_WITHOUT_NUMBER="${l%.*}"
			mv $FILE_NAME_WITHOUT_NUMBER.$LOG_NUMBER $FILE_NAME_WITHOUT_NUMBER.$NEW_LOG_NUMBER 
	done
done
NEW_LOG_FILES=$(find . -maxdepth 1 -iname "*.log")
for i in $NEW_LOG_FILES
do
	mv $i $i.1
	touch $i
done
