#!/bin/bash

#This program uninstalls the folders that was installed using the install.sh

echo "Are you sure you want to uninstall RentalCarApp?  (Enter: Y or N)"
read ans

#If yes, remove the RentalCarApp from the Desktop
if [ $ans = "Y" ]; then
  cd ~/Desktop
  rm -R RentalCarApp
  bash frame.sh "Uninstallation complete"
else
  bash ~/Desktop/RentalCarApp/scripts/frame.sh "RentalCarApp is still in Desktop"
  exit
fi
