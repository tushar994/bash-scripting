#!/bin/bash
find . -type d | while read sentence
do
    arr=($(ls -sh -d $sentence))
    echo -n "${arr[1]} "
    echo "${arr[0]}"

done 
echo
find . -mindepth 1 -type d | while read sentence
do
    echo -n "$sentence        "
    k=$(find $sentence | wc -l)
    echo $k
done≥