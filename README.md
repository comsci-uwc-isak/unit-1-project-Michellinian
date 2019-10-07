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
### Defining the Problem (Topic 1.1.1)
The new system that we are going to create for the client is a program for recording information about the orders made by the customers. The car rental office would especially collect basic information about the distance driven for each car. This links with the syllabus 1.1.1 about "The context for which a new system is planned", because we are creating a new system of organizing car rental information. Since our client is a beginner in using computer, we need to create a program as simple as possible for our client. And while coding our program, we also need to think about the potential organizational issues that we will face through the process.

### Solution proposed
For this problem, the first thing we need to consider is the fact that our client is not used to using a computer. So what we need to do is to create a very simple program, so that even the people who don't understand the computer system are able to use. First thing we need to create is an install program, where we ask the client to create a folder for storing all the information that they need. Also we want to create another program that shows that the installation of the folder is successful. As I mentioned, we want a program, that clearly shows the instructions to the users, and a program which tells you if the user did it right or wrong. What we also need to create is the program called create, where it creates a folder for all the car information, and another program called record where it stores all the additional information to an individual file of the car that has just been created by the user.

### Success Criteria
These are the measurable outcomes: 
1. A car can be created and stored in the database
2. A car information can be edited
3. A car can be deleted from the database 
4. The installation is ***simple -> one step process***
5. A summary (total/ average dustance travlled) can be generated for a particular car
6. Trips can be recorded and stored for an existing car
7. A basic database system is implemented
8. A basic backup functionaltiy is avialable 

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
cd ~/Desktop
echo "moving to $path"
 
#Create App folder 
mkdir CarRentalApp

#Create database/scripts folder inside the CarRentalApp
cd CarRentalApp
mkdir db 
mkdir scripts

echo "structure created successfully"
```

### 2. Code for showing message to the user
This program prints the message for the user in a box created
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

### 3. Development of the function: Create a new car
1. Get inputs (Plates, Model, Color, Passenger number)
2. Check if the number of arguments are equal to 4 
3. Write to main file with one extra line without erasing other entries
4. Create car trip file with license plate.txt

```sh 
#!/bin/bash

if [ $# -ne 4 ]; then
        echo "Error with the number of arguments"
        echo "Enter License Maker Model Passengers"
        exit
fi

License=$1
Maker=$2
Model=$3
Pp=$4

echo "$License $Maker $Model $Pp" >> ~/Desktop/CarRentalApp/db/mainCarFile.txt
echo "" > ~/Desktop/CarRentalApp/db/$License.txt

bash frame "Installation Complete"
```


### 4. Development of another function: Record the trip information 
1. Check arguments (License, km, Dateout, Datein)
2. Check that the car exist 
3. If car exists, then write the trip info in the $License.txt file, without erasing previous trips 

```sh 
#!/bin/bash

#This program records the details (km, startOfTrip, endOfTrip) in the individual .txt files of the cars
if [ $# -ne 4 ]; then
        echo "Error with the number of arguments"
        echo "Enter the information in the following order: License Distance StartDayOfTrip EndDayOfTrip"
        exit
fi

License=$1
Distance=$2
StartDayOfTrip=$3
EndDayOfTrip=$4

#Check if the file exist
if [ ! -f $License.txt ]; then
        echo "Car does not exist"
        exit
fi
echo "$Distance $StartDayOfTrip $EndDayOfTrip" >> ~/Desktop/CarRentalApp/db/$License.txt
bash frame "Trip recorded successfully"
```

Evaluation
-----------



