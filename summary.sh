#!/bin/bash

#This program summarizes the total distance of each car

#Step 1: Check the number of arguments
if [ $# -ne 1 ]; then
  echo "Invalid number of arguments!"
  echo "Please enter the license plate of the car"
fi

#Step 2: Check if the file exists in the database
cd ../db
FILE=$1
if [ ! -f "$FILE.txt" ]; then
  echo "File for car $FILE does not exist"
  exit
fi

#Step 3: calculate the total km
total=0
while read line
do
  for km in $line
  do
    (( total=$total+$km ))
    break
  done
done < "$FILE.txt"

#Step 4: Show result nicel y
cd ../scripts
bash frame.sh "Total distacne travel for $FILE was $total"