#!/bin/bash

min_number() {
    printf "%s\n" "$@" | sort -g | head -n1
}

leven(){


declare -A matrix
# num_rows=4
# num_columns=5

t1=$1 #"hello"
t2=$2 #"hello1"
firstlen=${#t1}
secondlen=${#t2}
num_rows=$secondlen
num_columns=$firstlen
echo $firstlen
echo $secondlen

for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]=$(( $i*$j ))
        echo -n $matrix[$i,$j]
    done
    echo "\n"
done
echo "last:"
# echo $(expr $firstlen - 1)
set -x
tt2=$(( firstlen ))
tt1=$(( secondlen ))
echo $tt1 $tt2
# echo $matrix[0][0]
# echo $matrix[1,4]
echo "$matrix[${tt1},${tt2}]"
# echo "matrix:"
}