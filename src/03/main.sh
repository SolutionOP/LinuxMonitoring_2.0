#!/bin/bash

if [[ $# != 1 ]]; then
    echo "Wrong counts of params!"
else
    ./validation.sh $1
fi