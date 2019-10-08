#!/bin/bash 

#This program records the details (km, startOfTrip, endOfTrip) in the individual .txt files of the cars 
if [ $# -ne 4 ]; then 
	echo "Error with the number of arguments"
	echo "Enter the information in the following order: License Distance StartDayOfTrip EndDayOfTrip"
	exit 
fi 

License=$1
Distance=$2
StartDayOfTrip=$3
EndDayOfTrip=$4

#Check if the file exist 
if [ ! -f $License.txt ]; then 
	echo "Car does not exist"
	exit 
fi 
echo "$Distance $StartDayOfTrip $EndDayOfTrip" >> ~/Desktop/CarRentalApp/db/$License.txt 
bash frame "Trip recorded successfully"
