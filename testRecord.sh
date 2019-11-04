#!/bin/bash

#This program tests the functionality of record.sh
#Step 1: execute record.sh
cd ../scripts
bash record.sh 50-05 600 2019/10/15 2019/10/20

#Step 2: Check if the car file is updated
tripInfo=$( tail -n 1 ../db/50-05.txt )
if [ "600 2019/10/15 2019/10/20" == "$tripInfo" ]; then
  echo "Trip Information was entered successfully: passed"
else
  echo "Test failed"
fi