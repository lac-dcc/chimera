#!/bin/bash

for file in $(find "." -name "*.v" -type f); do
    if [[ ! -f "$file" ]]; then
        continue
    fi
    echo "Analyzing file: $file"
    /home/joaovam/projects/yosys/yosys "-p read -sv $file ; hierarchy -check " 2>&1

done


 