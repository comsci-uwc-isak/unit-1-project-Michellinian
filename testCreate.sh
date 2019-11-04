#!/bin/bash

#This test program tests the functionality of create.sh
#Step 1: execute create.sh
cd ../scripts
bash create.sh 50-05 lexus blue 5

#Step 2: check if the car file exists
if [ -f "../db/50-05.txt" ]; then
  echo "Found file: passed"
else
  echo "File not found!"
fi

#Step 3: Check if the mainCarFile has been updated
lastLine=$( tail -n 1 ../db/mainCarFile.txt )
if [ "50-05 lexus blue 5" == "$lastLine" ]; then
  echo "Record was entered successfully: passed"
else
  echo "Test failed"
fi