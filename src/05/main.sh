#!/bin/bash

if [[ $# != 1 || $1 =~ [^1-4] ]]; then
    echo "Wrong value"
else
    export param=$1
    ./sort.sh
fi