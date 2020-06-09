#!/bin/bash
read -p "please enter your SGPA: " SGPA
x=$SGPA
if (( $(echo "0>$x" | bc -l)))
then
    echo "no one likes a smartass."
elif (( $(echo " 5>$x" | bc -l))) 
then
    echo "PROBATION"
    echo "AGLE SEM PHOD DENGE"
elif (( $(echo " 6>$x" | bc -l)))
then
    echo "AGLE SEM PHOD DENGE"
elif (( $(echo " 10<$x" | bc -l)))
then
    echo "HAHAHA even if your whole floor died, you can't get that much."
else
    y=$( echo "16-$x" | bc -l)
    echo "You need SGPA $y next sem"
fi