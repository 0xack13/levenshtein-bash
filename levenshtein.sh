#!/bin/bash

min_number() {
    printf "%s\n" "$@" | sort -g | head -n1
}

leven(){
    # key value pair
    declare -A matrix
    t1=$1
    t2=$2
    firstlen=${#t1}
    secondlen=${#t2}
    num_rows=$(( $secondlen + 1 ))
    num_columns=$(( $firstlen + 1 ))

    for ((i=1;i<=num_rows;i++)) do
        for ((j=1;j<=num_columns;j++)) do
            matrix[$i,$j]=0
        done
    done

    # init rows
    for ((i=1;i<=num_rows;i++)) do
            matrix[$i,1]=$(( i - 1 ))
    done

    # init columns
    for ((j=1;j<=num_columns;j++)) do
        matrix[1,$j]=$(( j - 1 ))
    done

    for ((i=2;i<=num_rows;i++)) do
        for ((j=2;j<=num_columns;j++)) do
            left=$(( $matrix[$(( i - 1 )),$j] + 1 ))
            down=$(( $matrix[$i,$(( j - 1 ))] + 1 ))
            left_down=$(( $matrix[$(( i - 1 )),$(( j - 1 ))] ))
            if [[ $t1[$(( i - 1 ))] != $t2[$(( j - 1 ))] ]]; then
                left_down=$(( left_down + 1 ))
            fi
            minval=$(min_number $left $down $left_down)
            matrix[$i,$j]=$minval
        done
    done
    echo "$matrix[$num_rows,${num_columns}]"
}

doyoumean() {
    declare -a words result1 result2 result3
    words=("top" "Nitro" "zero" "test4" "cow" "tool" "fool" "cool")
    for w in ${words[*]}
    do     
        r=$(leven $w $1)
        case $r in
        0)
            return
            ;;
        1)
            result1+=($w)
            ;;

        2)
            result2+=($w)
            ;;

        3)
            result3+=($w)
            ;;
        esac
    done
    if (( ${#result1[@]} )) || (( ${#result2[@]} )) || (( ${#result3[@]} )); then
        echo "Did you mean?"
        echo $result1 $result2 $result3
    fi
}