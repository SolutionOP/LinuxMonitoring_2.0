#!/bin/bash

# nullPath="$(find $firstParam)"
if [[ !(-d $firstParam) ]]; then
    echo "Wrong Path!"
    exit 1
fi

if [[ $secondParam =~ [^0-9] ]]; then
    echo "Wrong parameter of count folders"
    exit 1
else
    if [[ $secondParam -gt 100 || $secondParam -le 0 ]]; then
    echo "Wrong count of folders"
    exit 1
    fi
fi

export countOfFoldersNames=${#thirdParam}
if [[ ($countOfFoldersNames -gt 7) ]]; then
    echo "Wrong count of folders names"
    exit 1
else
    if [[ $thirdParam =~ [^A-Za-z] ]]; then
        echo "Wrong arguments in folders names"
        exit 1
    fi
fi

if [[ $fourthParam =~ [^0-9] ]]; then
    echo "Wrong counts of files"
    exit 1
else
    if [[ $fourthParam -gt 100 ]]; then
    echo "Too much files, max 100"
    exit 1
    fi
fi

export filename=$(echo $fifthParam | awk -F. '{print $1}')
export fileExt=$(echo $fifthParam | awk -F. '{print $2}')
if [[ ${#filename} > 7 || ${#fileExt} > 3 ||\
    $filename =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||\
    $fileExt == "" || ${#filename} < 1 ]]; then
    echo "Wrong argumets"
    exit 1
fi

export filesize=$(echo $sixthParam | awk -F"Kb" '{print $1}')
if [[ ! ($sixthParam =~ Kb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
    echo "Wrong size"
    exit 1
fi

./spawner.sh