#!/bin/bash

#This program deleted the car file from db folder
#It also deletes car information from the mainCarFile.txt

cd ../db

#Check the number of arguments
license=$1
if [ $# -ne 1 ]; then
  echo "Invalid number of arguments!"
  echo "Please enter the license of the car"
  exit
fi

#Check if the .txt file exist
if [ ! -f "$license.txt" ]; then
  echo "File does not exist!"
  exit
else
  rm $license.txt
  bash ../scripts/frame.sh "The file was successfully deleted"
  #delete the line from the mainCarFile.txt
  sed -i '' "/$license/d" mainCarFile.txt
  bash ../scripts/frame.sh "The line was successfully deleted"
  exit
fi
