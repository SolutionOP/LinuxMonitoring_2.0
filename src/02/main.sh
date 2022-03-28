#!/bin/bash
START=$(date +%s%N)
TIMES=$(date +%H:%M)

if [[ $# == 3 ]]; then
    export firstParam=$1
    export secondParam=$2
    export thirdParam=$3
    
    ./validation.sh
    END=$(date +%s%N)
    DIFF=$((($END - $START)/1000000))
    TIMEE=$(date +%H:%M)
    echo "Start time: $TIMES"
    echo "End time: $TIMEE"
    echo "Script working $DIFF ms"

    echo "">>logFiles
    echo "Start time: $TIMES" >>logFiles
    echo "End time: $TIMEE" >>logFiles
    echo "Script working $DIFF ms" >>logFiles
else
    echo "Wrong count of params"
fi