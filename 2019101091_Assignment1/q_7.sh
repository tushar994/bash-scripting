#!/bin/bash
read -p "Enter name: " name
read -p "Enter DOB: " foo

month='0'
year='0'
n='0'
for (( i=0; i<${#foo}; i++ )) 
do  
    if [ ${foo:$i:1} == '-' ]
    then
        n=$i
        break;
    fi
    month=$( echo "$month*10" | bc)
    month=$( echo "$month + ${foo:$i:1}" | bc)
done
if [ $month -lt 0 ]
then
    echo "please give a valid month"
    exit 1
elif [ $month -gt 12 ]
then
    echo "please give a valid month"
    exit 1
fi
n=$( echo "$n+1" | bc)
for (( i=$n; i<${#foo}; i++ )) 
do  
    year=$( echo "$year*10" | bc)
    year=$( echo "$year + ${foo:$i:1}" | bc)
done
read Y M D <<<$(date +'%Y %m %d')
yeardif=$( echo "$Y-$year" | bc)
yeardif=$( echo "$yeardif-1" | bc)
yeardif=$( echo "$yeardif*12" | bc)
monthdif=$( echo "12-$month" | bc)
monthdif=$( echo "$monthdif + $M" | bc)
dif=$( echo "$monthdif + $yeardif" | bc)
if [ $dif -lt 0 ]
then 
    echo "DAMN! You're from the future? I have so many questions!!!"
else
    echo "Hello $name your age is $dif months."
fi