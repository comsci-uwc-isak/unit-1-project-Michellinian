#!/bin/bash

#This program creates a new car and its own .txt file for storing all the information of the car
if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Color Passengers"
  exit
fi

license=$1
maker=$2
color=$3
passenger=$4

#Printing all the information entered by the user, inside the mainCarFile.txt
echo "$license $maker $color $passenger" >> ../db/mainCarfile.txt
echo "" > ../db/$license.txt

bash frame.sh "Car Installation Complete"