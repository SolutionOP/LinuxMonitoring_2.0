#!/bin/bash

param=$1
nDate="$(cat ../02/logFiles | awk -F'|' '{print $2}' | awk -F'_' '{print $3}')"
export newDate=${nDate: -7}

if [[ $param =~ [^0-9] ]]; then
    echo "Wrong value!"
    exit 1
else
    case $param in

    # По логу
    1)
        dfiles1="$(cat ../02/logFiles | awk -F'|' '{print $2}')"
        for i in $dfiles1
        do
            rm -rf $i
        done
        rm ../02/logFiles
    ;;

    # По дате и времени
    2)
        echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        read srcDate srcTime
        echo "Insert FROM >DATE< >TIME< Example: >YYYY-MM-DD HH:MM<"
        read dstDate dstTime
        rm -r $(find / -newermt "$srcDate $srcTime" -not -newermt "$dstDate $dstTime+1" 2>/dev/null | grep $newDate | sort) 2>/dev/null
        rm ../02/logFiles 
    ;;

    # По маске имени
    3)
        ./clean.sh
        rm ../02/logFiles
    ;;

    *)
    echo "Wrong value!"
    ;;
    esac
fi