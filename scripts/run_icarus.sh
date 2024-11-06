#!/bin/bash

for file in $(find "." -name "*.v" -type f); do
    if [[ ! -f "$file" ]]; then
        continue
    fi
    echo "Analyzing file: $file"
    iverilog "$file" 2>&1

done