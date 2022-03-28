#!/bin/bash

if [[ $# == 6 ]]; then
    export firstParam=$1
    export secondParam=$2
    export thirdParam=$3
    export fourthParam=$4
    export fifthParam=$5
    export sixthParam=$6

    ./validation.sh
else
    echo "Wrong count of params"
fi
