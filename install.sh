#!/bin/bash 

#This file creates the folder structure for the minimal Car Rental App

echo "Starting the installation"
echo "Enter the path where you want to install. Press Enter"

read path 

#Moving to the desired location 
cd ~/Desktop
echo "moving to $path"
 
#Create App folder 
mkdir CarRentalApp

#Create database/scripts folder inside the CarRentalApp
cd CarRentalApp
mkdir db 
mkdir scripts

echo  "Structure Created Successfully"

