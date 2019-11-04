#!/bin/bash

#This program tests the functionality of install.sh
#Step 1: execute install.sh
cd ../
bash install.sh

#Step 2: check if the database and scritps folders have been created
if [ -d "~/Desktop/RentalCarApp/db" ] && [ -d "~/Desktop/RentalCarApp/scripts/" ]; then
  echo "2 folders found: successful"
else
  echo "folders not found!"
fi
