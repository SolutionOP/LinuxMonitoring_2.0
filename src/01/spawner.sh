#!/bin/bash
> logFiles
foldersNames=$thirdParam
lastLatterOfFoldersName=${thirdParam: -1}
fileName=$filename
oldFileName=$fileName
lastLatterOfFileName=${fileName: -1}
logDate="$(date +"%d%m%y")"
newDate="DATE = $(date +"%d.%m.%y")"

if [[ ${#foldersNames} -lt 4 ]]; then
    for (( i=${#foldersNames}; i<4; i++ )); do
        foldersNames+="$(echo $lastLatterOfFoldersName)"
    done
fi

for (( i=1; i<=$secondParam; i++ )); do
    sudo mkdir "$firstParam/"$foldersNames"_"$logDate""
    for (( j=1; j<=$fourthParam; j++)); do
        sudo fallocate -l $filesize ""$firstParam"/"$foldersNames"_"$logDate"/"$fileName"."$fileExt"_"$logDate""
        echo ""$newDate" | "$firstParam"/"$foldersNames"_"$logDate"/"$fileName"."$fileExt"_"$logDate" | Size of file = $filesize Kb.">>logFiles
        fileName+="$(echo $lastLatterOfFileName)"
    done
    fileName=$oldFileName
    foldersNames+="$(echo $lastLatterOfFoldersName)"
done