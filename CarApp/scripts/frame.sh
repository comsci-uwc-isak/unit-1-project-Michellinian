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


