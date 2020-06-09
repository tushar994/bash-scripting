#!/bin/bash
read -p "Enter A: " a
if ! [[ $a =~ ^[+-]?[0-9]+$ ]]
then
    echo "Sorry integers only"
    exit 1
fi

read -p "Enter B: " b
if ! [[ $b =~ ^[+-]?[0-9]+$ ]]
then
    echo "Sorry integers only"
    exit 1
fi
function GCF
{
    A=$1
    B=$2
    if [ $A -gt $B ]
    then
        k=$A
        A=$B
        B=$k
    fi
    while(( $( echo "$A>0" | bc ) ))
    do
        B=$( echo "$B%$A" | bc)
        k=$A
        A=$B
        B=$k
    done
    GCD=$B
    echo "GCD : $GCD"
}
function LCM 
{
    A=$1
    B=$2
    if [ $A -gt $B ]
    then
        k=$A
        A=$B
        B=$k
    fi
    while(( $( echo "$A>0" | bc ) ))
    do
        B=$( echo "$B%$A" | bc)
        k=$A
        A=$B
        B=$k
    done
    GCD=$B
    prod=$( echo "$a*$b" | bc)
    LCM=$( echo "$prod/$GCD" | bc)
    echo "LCM : $LCM"
}
GCF $a $b
LCM $a $b
exit 0