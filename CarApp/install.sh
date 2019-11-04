#!/bin/bash

#This file creates the folder structure for the minimal Car Rental App

echo "Starting the installation"
echo "Installing the RentalCarApp in the desktop"

#Moving to the desktop
cd ~/Desktop

#Create App folder
mkdir RentalCarApp

#Create database/scripts/tests folder inside the RentalCarApp
cd RentalCarApp
mkdir db

cd ~/Desktop/CarApp
cp -r scripts/ ~/Desktop/RentalCarApp/scripts

echo "structure created successfully"