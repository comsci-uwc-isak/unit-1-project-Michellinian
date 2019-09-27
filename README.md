![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
**Defining the Problem (Topic 1.1.1)**

The new system that we are going to create for the client is a program for recording information about the orders made by the customers. The car rental office would especially collect basic information about the distance driven for each car. This links with the syllabus 1.1.1 about "The context for which a new system is planned", because we are creating a new system of organizing car rental information. Since our client is a beginner in using computer, we need to create a program as simple as possible for our client. And while coding our program, we also need to think about the potential organizational issues that we will face through the process.


Design
---------
### First sketch of the system 
[SystemDiagram](https://www.draw.io/?lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1#G1KBj12ggXIOlJj7rTtTJUD-R3fKnx1MDV)

**Fig. 1** First sketch of the system showing the main input/output components, actions, and software requirements.

Development
--------
### 1. Script to install the app 
The following script creates the app folder and inside it creates two more folders: db and scripts.
```sh 
#!/bin/bash

#This file creates the folder structure for the minimal Car Rental App

echo "Starting the installation"
echo "Enter the path where you want to install. Press Enter"

read path

#Moving to the desired location
cd $path
echo "moving to $path"
echo $pwd
#Check for correct change directory
if [ "$path" != "$pwd" ]; then
        echo "Error creating the folder structure"
        exit
fi

#Create App folder
mkdir RentalCarApp

#Create database/scripts folder inside the RentalCarApp
cd RentalCarApp
mkdir db
mkdir scripts

echo "structure created successfully"
```

### 2. Create a program where the argument is printed in the middle of the box
```sh 
#!/bin/bash

#Create variable for arguments
word=$1
#Check how many letters are in the argument
letters=${#word}

#Create a 100 x 5 rectangle made out of asterisk
for (( a=0; a<100; a++ ))
do 
	echo -n "*"
done

echo
echo -n "*"
for (( b=0; b<98; b++ ))
do
    echo -n " "
done
echo -n "*"
echo
echo -n "*"
(( insert = (100 - $letters) / 2 - 1))
for (( b=0; b<$insert; b++ ))
do
    echo -n " "
done
echo -n $word
for (( b=0; b<$insert + 1; b++ ))
do
    echo -n " "
done
echo "*"
echo -n "*"
for (( b=0; b<98; b++ ))
do
    echo -n " "
done
echo -n "*"
echo

for (( a=0; a<100; a++ ))
do
    echo -n "*"
done
echo

```



Evaluation
-----------



