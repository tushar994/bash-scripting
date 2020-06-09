#!/bin/bash
read -p "please give the number: " num
for (( i=2;i>=0;i--))
do
    one='I'
    five='V'
    ten='X'
    curpow=$( echo "10^$i" | bc)
    curdig=$( echo "$num/$curpow" | bc)
    num=$( echo "$num%$curpow" | bc)
    if [ $i == 2 ]
    then
        one='C'
        five='D'
        ten='M'
    elif [ $i == 1 ]
    then
        one='X'
        five='L'
        ten='C'
    else
        one='I'
        five='V'
        ten='X'
    fi
    if [ $curdig -lt 4 ]
    then
        for (( j=0;j<$curdig;j++))
        do 
            echo -n "$one"
        done
    elif [ $curdig == 4 ]
    then
        echo -n "$one"
        echo -n "$five"
    elif [ $curdig -lt 9 ]
    then
        echo -n "$five"
        for (( j=5;j<$curdig;j++ ))
        do
            echo -n "$one"
        done
    elif [ $curdig == 9 ]
    then
        echo -n "$one"
        echo -n "$ten"
    else
        echo -n "$ten"
    fi
done
