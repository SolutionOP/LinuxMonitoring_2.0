#!/bin/bash
> logFiles
filesDate="$(date +"%d%m%y")"
logDate="DATE = $(date +"%d.%m.%y")"

folderNameRand="$(compgen -d / | shuf -n1)"
foldersNames=$firstParam
lastLatterOfFoldersName=${firstParam: -1}
fileNames=$fileName
oldFileName=$fileNames
lastLatterOfFileName=${fileNames: -1}

if [[ ${#foldersNames} -lt 5 ]]; then
    for (( i=${#foldersNames}; i<5; i++ )); do
        foldersNames+="$(echo $lastLatterOfFoldersName)"
    done
fi

countOfFolders=100
for (( i=1; i<=$countOfFolders; i++ )); do
    folderNameRand="$(compgen -d / | shuf -n1)"
    filesCounter="$(shuf -i 50-100 -n1)"
    if [[ $folderNameRand == "/bin" || $folderNameRand == "/sbin" ||\
        $folderNameRand == "/proc" || $folderNameRand == "/sys" ]]; then
        countOfFolders+="$(echo $countOfFolders+1)"
        continue
    fi

    sudo mkdir "$folderNameRand/"$foldersNames"_"$filesDate"" 2>/dev/null
    for (( j=1; j<=${filesCounter}; j++)); do
        avelSize="$(df -h / | awk '{print $4}' | tail -n1)"
        if [[ ${avelSize: -1} == "M" ]]; then
            exit 1
        fi
            sudo fallocate -l $filesize"M" ""$folderNameRand"/"$foldersNames"_"$filesDate"/"$fileNames"."$fileExt"_"$filesDate"" 2>/dev/null
            echo ""$logDate" | "$folderNameRand"/"$foldersNames"_"$filesDate"/"$fileNames"."$fileExt"_"$filesDate" | Size of file = $filesize Mb.">>logFiles
            fileNames+="$(echo $lastLatterOfFileName)"
    done
    fileNames=$oldFileName
    foldersNames+="$(echo $lastLatterOfFoldersName)"
done