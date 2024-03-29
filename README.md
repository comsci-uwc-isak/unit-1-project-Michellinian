![CarRental](logo.png)
```.py
Marks=23
Demo=4
Total=(Marks + Demo) = 27
```
**Graded Nov 5**

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
For this problem, the first thing we need to consider is the fact that our client is not used to using a computer. So what we need to do is to create a very simple program, like a one step program, so that even the people who don't understand the computer system are able to use without any difficulties. We first need a program that does the installation process of the car rental app, in one step. It should be something like, when the user types in "install", it should automatically create the folder in the desktop. It is preferable that there are 2 folders in the folder, one storing all the data of the cars, and the other for putting all the scripts of the program inside. It is necessary that we have a program that records the car information that the users enter, into the database folder. These programs, as mentioned before should be amde user-friendly, especially for our clients. Also there can be some additional functions such as editting the files, creating a backup, etc. We will be doing all of this in bash programming language.

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

## Criterion A
|**level**|**Description**|
|-----|------------|
|4|The client in the car rental office is identified and his situation is stated. The rationale for choosing the proposed product is partially explained and includes some appropriate criteria for evaluating the success of the product.|
```.sh
Rationale
*Your success criteria are mostly reasonable and measurable. Good job here. Some adjectives such as basic needs a definition so that they can be measured.
*The definition of the problem and the client is limited so we dont get a full picture of why he needs a new computer system
*You justificaiton for selecting the proposed solution and tools, meaning working with Bash, is not mentioned. This is a critical point since the choice of programming platform will impact the outcome.

```
Design
---------
### First sketch of the system 
![SystemDiagram](System_diagram.png)

**Fig. 1** First sketch of the system showing the main input/output components, actions, and software requirements.

### How the RentalCarApp works
The user will use their keyboard to input information that they want to store. Through all the actions that can be done in RentalCarApp, it allows the users to manipulate the information however they want to. The file structure of this RentalCarApp: inside the app folder, there are two folders; database folder and the scripts folder. The database folder is for the users to use. It stores every data the user inputs through their keyboard. The scripts folder contains all the code for the actions. The output for this program is screen / hard copy. The user can also backup all the information into for example a hard drive.

### Algorithm flow diagrams
![FrameFlowchart](frame.png)

**Fig. 2** First sketch of the flow diagram for the script where messages for the users are showed

![CreateFlowchart](create.png)

**Fig. 3** Sketch of how the car installation program would work. 

![DeleteFlowchart](delete.png)

**Fig. 4** Flow chart of how the delete program would work.

## Criterion B
|**level**|**Description**|
|-----|------------|
|8|An outline test plan is included but partially complete. A system diagram and some flow diagrams for algorithms in the product are included. They provide a basic understanding of how the product was developed.|
```.sh
Rationale
*Great job with the system diagram. I understood that the paragraph that you have under the diagram was the explanation of the system. If so, you can use the figure as a reference and refeer to it with Fig. 1. For example: "As shown in Fig. 1, the computational system consists of ..."
* Good job with the flow diagrams. Here you did not get all the full marks because you are missing the description for all 3 diagrams. Remember, an image without description is an unbiguous tool. Add a paragram explaining what YOU see in the image and the reason why you included. 
* You test plan, down at the bottom of this document is partially correct. Steps are good and logical, inputs and expected outputs are less clear and you checked your program, added MET, as a evidence, but the reader does not know the evidence for the MET. You could add another column to the table explaining the evidence for the MET result.
```

Development
--------
### 1. Script to install the app 
The following script creates the app folder and inside it creates two more folders: db and scripts.
```sh 
#!/bin/bash

#This file creates the folder structure for the minimal Car Rental App

echo "Starting the installation"
echo "Installing the RentalCarApp in the desktop"Impro

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
```
I changed this code several times.
1. Ask the user for the location and create the folder in that location 
2. Because of how the user had to type in the exact location of the folder and it wasn't user friendly, I created another code, which automatically creates the folders in the desktop 
3. I initally created a code that said something like this:
```sh 
mkdir RentalCarApp
cd RentalCarApp
mkdir db 
mkdir scripts 
```
Although, when the user executed the install script, all the scripts that were inside would be initialized. Therefore, we had to create a CarApp which has all the scripts inside, and then create another all called RentalCarApp, for the users only. To do this we used the copy command to copy the scripts folder inside the CarApp and move it to the new RentalCarApp. The new code is this: 
```sh 
#Create App folder
mkdir RentalCarApp

#Create database/scripts/tests folder inside the RentalCarApp
cd RentalCarApp
mkdir db

#Copy the scripts folder from the carapp and install it in the RentalCarApp
cd ~/Desktop/CarApp
cp -r scripts/ ~/Desktop/RentalCarApp/scripts
```
This fixed the problem that I was facing before. 



### 2. Code for showing message to the user
This program prints the message for the user in a box created
```sh 
#!/bin/bash

#Prpgram that create pop-out message for the user

word=$1
letter=${#word}

#First line
for (( a=0; a<100; a++ ))
do
  echo -n "*"
done
echo

#Second line
echo -n "*"
for (( b=0; b<98; b++ ))
do
  echo -n " "
done
echo "*"

#Third line (with the word)
echo -n "*"
(( insertOne = (100 - $letter)/ 2 - 1 ))
for (( b=0; b<$insertOne; b++ ))
do
  echo -n " "
done
echo -n $word
(( insertTwo = 100 - ($insertOne + $letter) - 2 ))
for (( b=0; b<$insertTwo; b++ ))
do
  echo -n " "
done
echo "*"

#Fourth line
echo -n "*"
for (( b=0; b<98; b++ ))
do
  echo -n " "
done
echo "*"

#Last line
for (( a=0; a<100; a++ ))
do
  echo -n "*"
done
echo
```
There were a lot of difficulties developing this code. The mathematical calculation of how to insert the word in the center of the box was the hard part for me. It took several tries to create the correct equation. My previous code, worked in some words, but for other words it didn't function correctly. After adjusting some numbers in the equation, I managed to make a code that works in every case.

### 3. Development of the function: Create a new car
1. Get inputs (Plates, Model, Color, Passenger number)
2. Check if the number of arguments are equal to 4 
3. Write to main file with one extra line without erasing other entries
4. Create car trip file with license plate.txt

```sh 
#!/bin/bash

#This program creates a new car and its own .txt file for storing all the information of the car
if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Color Passengers"
  exit
fi

license=$1
maker=$2
color=$3
passenger=$4

#Printing all the information entered by the user, inside the mainCarFile.txt
echo "$license $maker $color $passenger" >> ../db/mainCarfile.txt
echo "" > ../db/$license.txt

bash frame.sh "Car Installation Complete"
```


### 4. Development of another function: Record the trip information 
1. Check arguments (License, km, Dateout, Datein)
2. Check that the car exist 
3. If car exists, then write the trip info in the $License.txt file, without erasing previous trips 

```sh 
#!/bin/bash

#This file records the trip information of the car and creates an individual file

if [ $# -ne 4 ]; then
    echo "Error with the number of arguments"
    echo "Enter License Distance StartDayOfTrip EndDayOfTrip"
    exit
fi

license=$1
distance=$2
start=$3
end=$4

#Check if the file exist
if [ ! -f "../db/$license.txt" ]; then
    echo "Car does not exist"
    exit
fi
echo "$distance $start $end" >> ../db/$license.txt
bash frame.sh "Trip recorded successfully"
```


### 5. Development of Summary Action 
This code calculates the total distance of a particular car.
```sh 
#!/bin/bash

#This program summarizes the total distance of each car

#Step 1: Check the number of arguments
if [ $# -ne 1 ]; then
  echo "Invalid number of arguments!"
  echo "Please enter the license plate of the car"
fi

#Step 2: Check if the file exists in the database
cd ../db
FILE=$1
if [ ! -f "$FILE.txt" ]; then
  echo "File for car $FILE does not exist"
  exit
fi

#Step 3: calculate the total km
total=0
while read line
do
  for km in $line
  do
    (( total=$total+$km ))
    break
  done
done < "$FILE.txt"

#Step 4: Show result nicel y
cd ../scripts
bash frame.sh "Total distacne travel for $FILE was $total"
```


### 6. Development of the script Delete
This code uses arguments from the users. 
1. Checks if it has the correct number of arguments
2. Check if the file that the user is looking for exists 
3. If it does delete the car file, along the line of the car in the mainCarFile.txt 
```sh 
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
else
  rm $license.txt
  bash ../scripts/frame.sh "The file was successfully deleted"
  #delete the line from the mainCarFile.txt
  sed -i '' "/$license/d" mainCarFile.txt
  bash ../scripts/frame.sh "The line was successfully deleted"
fi
exit
```
My first code worked, although there was an error with the code:
```sh 
bash frame.sh "The file was successfully deleted"
```
It took me a while to figure out that the frame.sh could not be executed because, the frame.sh was located in a different file. This is why I had to add the `bash ../scripts/frame.sh` part in the code. Now that I told the computer that the frame.sh is inside the scripts folder, it can successfully execute the frame script. 


### 7. Development of the script Edit
This code should allow the user to edit the car file. 
1. Check if the number of arguments type in by the user is a valid number 
2. Check if the license number is an existing car 
3. If it exists delete the car information in the mainCarFile.txt and rewrite it with the new information given in arguments
```sh 
#!/bin/bash

#This program edit the information of an exiting car in the mainCarFile
#User enters [license plate] [maker] [color] [passenger]

if [ $# -ne 4 ]; then
  echo "Invalid number of arguments"
  echo "Enter License Maker Color Passengers"
  exit
fi

license=$1
maker=$2
color=$3
passenger=$4

cd ../db

#Check if the $license.txt exists
if [ ! -f "$license.txt" ]; then
  echo "File not found!"
  exit 
fi

#identify the line with the given license plate and delete it
sed -i '' "/^$license/d" mainCarFile.txt
#add the new information
echo "$license $maker $color $passenger" >> mainCarFile.txt
cd ../scripts
bash frame.sh "Car edited successfully"
```


### 8. Developing the uninstall.sh 
Program for uninstalling the RentalCarApp. 
1. Ask the user for confirmation 
2. If the user answers yes, remove RentalCarApp from the desktop 
```sh 
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
  bash frame.sh "RentalCarApp is still in Desktop"
  exit
fi
```
In this uninstall program, it is very important to ask the user if they really want to uninstall the program. This is because if you uninstall the program all the database the user created would be removed from the computer. This is why it is necessary to ask for confirmation of the user is they want to remove the folder.


### 9. Developing a script for backup 
1. Get the location where the user wants to backup the RentalCarApp 
2. If valid number of arguments entered, copy the folder and move the copy to the desired location 
```sh 
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
```
In this script `cp -a ~/Desktop...` essentially copies the entire directory, and sends the copy to another location. The location is set by the user, by arguments. 

### 10. Development of the test script 
**1. Test install script**
1. Execute install.sh 
2. If db and scripts folder found echo "test successful"
```sh 
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
```


**2. Test create script** 
1. Go to the scripts folder and execute create.sh 
2. Check if the license.txt file exists
3. Check that the car was also created inside the mainCarFile.txt 
```sh 
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
```
The command `lastLine=$( tail -n 1 ../db/mainCarFile.txt )` was new to me. This was the only difficulty in this code. For the rest it just uses if statements to check if the file exists or not, which is very simple.

**3. Test record script**
1. Go to the scripts folder and execute record.sh 
2. Check if the trip info was successfully added in the license.txt file 
```sh 
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
```


### 11. Creating Man Pages
Man pages are for the users, shortened for manual pages. It gives every information of the scripts for the user, so that they can understand what each each script is for.
**1. Create.sh**
```sh 
.TH man 6 "28 Oct 2019" "1.0" "create man page"
.SH NAME 
create \- create a new car 
.SH SYNOPSIS
bash create.sh [license] [model] [color] [passengers]
.SH DESCRIPTION
create is a script that creates a new record in the database
.SH EXAMLPES
bash create.sh LXY98 Mazda Red 3 
.SH AUTHOR 
Arata Katayama
```
Description for the create script. 

**2. Record.sh**
```sh 
.TH man 6 "28 Oct 2019" "1.0" "record man page"
.SH NAME 
record \- record the trip information of the car
.SH SYNOPSIS
bash record.sh [license] [distance] [dateOfTheStart] [dateOfTheEnd]
.SH DESCRIPTION
record is a script that inputs the new information in the $license.txt file. 
.SH EXAMLPES
bash record.sh LXY98 4500 2019/07/14 2019/07/23 
.SH AUTHOR 
Arata Katayama
```
Description of the record.sh.

**3. Delete.sh**
```sh 
.TH man 6 "28 Oct 2019" "1.0" "delete man page"
.SH NAME 
delete \- delete the car file as well as the corresponding line in the mainCarFile.txt
.SH SYNOPSIS 
bash delete.sh [license]
.SH DESCRIPTION
delete is a script that removes the unwanted / unnecessary car file from the db folder, and also deletes the line corresponding the car in the mainCarFile.txt.
.SH EXAMPLES
bash delete.sh LXY98
.SH AUTHOR
Arata Katayama
```
Descriptiion of the delete script. 
These are just the script of the definition of each scripts. When the user wants to access them they need to type in `man \nameOfScript`. By doing this the user can see the man pages and familiarize themselves with what each script is about. Also for the developer, when creating man page, we should be careful if the name of the scripts are different. Because the script name and man page name are the same, it is better and safer if we created in a folder.

## Criterion C
|**level**|**Description**|
|-----|------------|
|5|The proposed solution is characterized by the appropriate use of existing tools. The techniques are adequate for the task and their use is explained. All sources are identified.|
```.sh
Rationale
* Great job here Arata
* You can get full mark next time by including refereces (MLA) to the resources you researched.
```

### Checking all the scripts functionality
| Scripts | Criteria | Check |
| --- | --- | --- | 
| install.sh | the RentalCarApp created in the desktop; database & scripts folders created in the app folder | YES |
| create.sh | car file created in the db folder; mainCarFile.txt updated | YES |
| record.sh | trip information updated in the car file | YES |
| edit.sh | update the mainCarFile.txt with new information | YES |
| delete.sh | remove car file from db folder remove line in mainCarFile.txt | YES |
| summary.sh | show the sum of trip distance of a car assigned | YES |
| backup.sh | copy the app folder to location designated by user | YES |
| uninstall.sh | delete the entire RentalCarApp folder | YES |



Evaluation
-----------

### Checking success criterias 
**1. A car can be created and stored in the database**

The test.sh code essentially checks if the car has been created successfully, in the mainCarFile.txt. It also checks if an individual .txt file for the car has been made and put into the db folder. The output of this program is this. 
```sh 
****************************************************************************************************
*                                                                                                  *
*                                    Car Installation Complete                                     *
*                                                                                                  *
****************************************************************************************************
txt file of the car was created successfully
Record was entered successfully
```
This shows that the create.sh is working without any errors. All the files that should've been created in the database is created correctly.

**2. A car information can be edited**

This is enabled by the edit.sh program. When the user want to edit the information that they already entered, they can type in "bash edit.sh", followed with the new information that they want to substitute the old onew with. It requires 4 arguments, the license plate, maker, color, and the number of passengers. This allows the user to update their car information, without deleting the car and creating another file every time. For example let's say the previous information in 40-67.txt was: 
```sh 
300 2018/09/11 2018/09/23
```
After the user type in: 
```sh 
bash edit.sh 40-67 450 2018/09/11 2018/09/25
```
The new information in the 40-67.txt should be changed accordingly to the new arguments.


**3. A car can be deleted from the database**

The users can also just delete the information, instead of changing them. The delete.sh allows the users to delete unnecessary information about the car. When the user types in "bash delete.sh $license" it finds the txt file with the license name that the user typed in as an argument, and delete the whole file. It also deletes the information from the mainCarFile.txt.


**4. The installation is ***simple -> one step process*****

For the script install, it has to be a one step, simple process for the user. The code that has been uploaded above, under the section "Script to install the app", is the install.sh, and this allows the user to install the RentalCarApp as simply as possible. When the user type in "bash install.sh", it automatically creates the folder in the desktop.


**5. A summary (total/ average dustance travlled) can be generated for a particular car**

This code makes the user able to calculate the total distance a particular car drove for. This is also user friendly in a way that the user only has to type in the license number and it calculates the total distance for us. The input from the user would be for example:
```sh 
bash summary.sh 40-67
```
If the 40-67.txt file data was as following: 
```sh 
300 2018/09/11 2018/09/23
4300 2018/09/25 2018/10/05
1900 2018/10/14 2018/10/31
```
Then the output of this program is this:
```sh 
****************************************************************************************************
*                                                                                                  *
*                             Total distance travel for 40-67 was 6500                             *
*                                                                                                  *
****************************************************************************************************

```

**6. Trips can be recorded and stored for an existing car**

The reocord script is basically for doing this. It records the trip information that the user types in as arguments, and then those information automaitcally gets copied into the car file. When the user types in bash, command, arguments:
```sh 
bash record.sh 40-67 1900 2018/10/14 2018/10/31
****************************************************************************************************
*                                                                                                  *
*                                    Trip recorded successfully                                    *
*                                                                                                  *
****************************************************************************************************
```
This appears on the terminal. If we go to the 40-67.txt we will see that the file contains the new arguments the user typed in.

**7. A basic database system is implemented**

In the very first procedure of using the app, which is to install the RentalCarApp, it also installs the database older inside the RentalCarApp folder. This means that the basic database system is already implemented inofrst place.

**8. A basic backup functionaltiy is avialable**

The backup script allows the user to create a backup for the RentalCarApp. When the user types in for example: 
```sh 
 bash backup.sh ~/Documents/ComSci/
****************************************************************************************************
*                                                                                                  *
*                                         Backup succeeded                                         *
*                                                                                                  *
****************************************************************************************************
```
The user wanted to create a backup of this folder in the ComSci folder, located in the Documents folder. Let's check if it actually did that: 
![BackupEvidence](Backup.png)
It seems that that the folder has been backuped successfully!

### Improvements in the future
**1. Easier location designation for the user**

In the current program, whenever the user had to type in the location of the folder, for example in the backup.sh. the user had to type in the exact location of the folder like this:
```sh 
bash backup.sh ~/Desktop/backup
```
The user has to know a certain amount of knowledge of how to use the computer, or else they cannot designate the folder they want to back it up to. We need to find an easier way to determine the location, like when the user types in bakcup folder, the computer finds the backup folder, no matter wherever it is and copy the folder into there. This would make the process for the user, a lot easier. 

**2. Installation**
For the current installation, the user has to first go into to the CarApp folder in order to install the RentalCarApp folder. This is a little user-unfriendly, considering that our client is not used to using a computer. We need to make the process as simple as possible for them. It would've been better if the install script was easier to access for the user, so that they don't have to type `cd ../CarApp` to go into carapp to find the install.sh.

**3. Uninstall script**
Since uninstall deletes every data the user typed in, it is very important to ask if they really want to delete the folder. Also it would've been better if I asked the user if they have done the backup for the folder, in case the user needs after they've uninstalled the folder. Although sometimes, the user don't remember if they created a backup or not. Therefore, the most effective way to develop this uninstall script is by implementing a code where it checks if the user created a backup folder or not. Then the user would immediately know that there is a backup, so even if they uninstall the RentalCarApp folder, it's entirety would not be deleted.


### Summary
This program was developed by **dynamic testing**. Dynamic testing is a type of software testing, where we test the actual code by putting user input, to see if the output is the desired answer or not. In this program, we tested by putting user input while developing the program, to find any errors that occured, beforehand so that I wouldn't have to fix every errors at the last. Dynamic testing made the development of the program easier and more clear. Also **white-box testing** is another type of sofware testing style that I used. White-box testing is where the tester, usually the developer, tests the user input and output of the code, by checking the actual code that the developer developed. I knew what was going on with the code that I created, therefore this would be a white-box testing. 

## Criterion D
|**level**|**Description**|
|-----|------------|
|6|The product is fully evaluated against the success criteria identified in criterion A. Recommendations for further improvement of the product are realistic.|
```.sh
Rationale
* This was a perfect criterion Arata! well done. The evaluation of the criteria is great, clear and to the point. Improvements are realistic and necessary.
```

