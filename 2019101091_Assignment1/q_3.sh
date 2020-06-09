#!/bin/bash
var=$(ping -c $1 google.com)
k=0
h=$(echo "$1 + 1" | bc )
w="Request timeout for icmp_seq 0"
while read line
do
    what=$(echo "$line" | grep "timeout")
    val="$?"
    if [ $val == 0 ]
    then
        val=0
    else        
        if [ $k -gt 0 ]
        then
                if [ $k -lt $h ]
                then
                    echo -n "$k."
                fi
        fi
        k=$(echo "$k + 1" | bc)
        echo "$line"
    fi    
done <<<$var

