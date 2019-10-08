#!/bin/bash 

if [ $# -ne 4 ]; then 
	echo "Error with the number of arguments"
	echo "Enter License Maker Model Passengers"
	exit 
fi 

License=$1
Maker=$2
Model=$3
Pp=$4

echo "$License $Maker $Model $Pp" >> ../db/mainCarFile.txt
echo "" > ../db/$License.txt 

bash frame "Installation Complete"
  
