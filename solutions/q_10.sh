#!/bin/bash
declare -a arr
i=0
n=$#
if [ $# == 0 ]
then
    echo "you didn't give any numbers."
    exit 1
fi
p=$( echo "$n-1" | bc )
for var in "$@"
do
    arr[$i]=$var
    i=$(( "i+1" ))
done
for ((i=1; i<$n; i++))
do
    j=0
    while (( $(echo " ${arr[$j]} < ${arr[$i]} " | bc -l) ))
    do
        j=$( echo "$j + 1" | bc)
        if [ $j == $n ]
        then 
            break
        fi
    done
    rep=${arr[$i]}
    for ((k=j; k<=$i; k++))
    do
        store=${arr[$k]}
        arr[$k]=$rep
        rep=$store
    done
done 
for (( j=0; j<$#; j++))
do
    echo -n "${arr[$j]} "
done