#!/bin/bash

if [[ ($firstParam =~ [0-9]) || ($firstParam =~ [^A-Za-z]) ||\
    (${#firstParam} -gt 7) ]]; then
    echo "Wrong folders names"
    exit 1
fi

export fileName="$(echo $secondParam | awk -F. '{print $1}')"
export fileExt="$(echo $secondParam | awk -F. '{print $2}')"
if [[ ${#fileName} > 7 || ${#fileExt} > 3 ||\
    $fileName =~ [^A-Za-z] || $fileExt =~ [^A-Za-z] ||\
    ($fileExt == "") || ${#fileName} < 1 ]]; then
    echo "Wrong files names"
    exit 1
fi

export filesize=$(echo $thirdParam | awk -F"Mb" '{print $1}')
if [[ !($thirdParam =~ Mb$) || ($filesize =~ [^0-9]) || ($filesize -gt 100) || ($filesize -le 0) ]]; then
    echo "Wrong size"
    exit 1
fi

./spawner.sh