#!/bin/bash
var=$( df | awk '{print $1, $5}' )
i=0

RED='\033[0;31m'
NC='\033[0m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
if [ $# -lt 2 ]
then
echo "please give two arguments"
exit 1
fi

while read line
do  
    if [ $i == 0 ]
    then
        i=1
    else
        add=$(echo $line | grep '%')
        if [ ${#add} != 0 ]
        then
            bigf=$(echo $line | grep 'tmpfs')
            if [ ${#bigf} == 0 ]
            then
                percen=$(echo $add | awk '{print $2}')
                disk=$(echo $add | awk '{print $1}')
                num=$( echo $percen | tr -d "%")
                if [ $num -lt $1 ]
                then
                    echo -e "${BLUE}OK,$disk,$percen${NC}"
                elif [ $num -lt $2 ]
                then
                    echo -e "${YELLOW}WARNING,$disk,$percen${NC}"
                else
                    echo -e "${RED}CRITICAL,$disk,$percen${NC}"
                fi
            fi
        fi
    fi
done <<<$var