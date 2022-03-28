#!/bin/bash

if [[ $# != 0 ]]; then 
    echo "Wrong value"
else
    goaccess ../04/*.log --log-format=COMBINED --invalid-requests=invalid.log -a -o index.html
fi