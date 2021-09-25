#!/bin/bash
if [[ $1 && $2 && $3 =~ [0-9] ]]; then
    echo "Your sum is equal to $SUM"
else
    echo "not all characters are numeric. Anyway your number's sum is $SUM"
fi
SUM=$(($1 + $2 + $3));
echo $SUM
