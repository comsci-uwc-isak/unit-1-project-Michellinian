#!/bin/bash

#This file records the trip information of the car and creates an individual file

if [ $# -ne 4 ]; then
    echo "Error with the number of arguments"
    echo "Enter License Distance StartDayOfTrip EndDayOfTrip"
    exit
fi

license=$1
distance=$2
start=$3
end=$4

#Check if the file exist
if [ ! -f "../db/$license.txt" ]; then
    echo "Car does not exist"
    exit
fi
echo "$distance $start $end" >> ../db/$license.txt
bash frame.sh "Trip recorded successfully"
