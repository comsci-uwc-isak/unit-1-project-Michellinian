#!/bin/#!/usr/bin/env bash

#This program creates a backup for the RentalCarApp folder

#Get argument of where the user wants to create a backup
location=$1

#Check if the number of the arguments are correct
if [ $# -ne 1 ]; then
  echo "Invalid path! Enter an existing path"
  echo "Backup falied"
else
  #Copy the RentalCarApp and put it the copy in another location
  cp -a ~/Desktop/RentalCarApp $location
  bash frame.sh "Backup succeeded"
fi

