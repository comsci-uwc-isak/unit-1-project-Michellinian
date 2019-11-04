#!/bin/bash

#This program edit the information of an exiting car in the mainCarFile
#User enters [license plate] [maker] [color] [passenger]

if [ $# -ne 4 ]; then
  echo "Invalid number of arguments"
  echo "Enter License Maker Color Passengers"
  exit
fi

license=$1
maker=$2
color=$3
passenger=$4

cd ../db

#Check if the $license.txt exists
if [ ! -f "$license.txt" ]; then
  echo "File not found!"
  exit
fi

#identify the line with the given license plate and delete it
sed -i '' "/^$license/d" mainCarFile.txt
#add the new information
echo "$license $maker $color $passenger" >> mainCarFile.txt
cd ../scripts
bash frame.sh "Car edited successfully"
