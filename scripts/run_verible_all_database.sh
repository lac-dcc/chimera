#!/bin/bash

# This script runs the executable of the parser passed as argument, we recommend verible's parser, and extracts the trace file. We use it 
# as input for the count_productions.py script.

# Check if directory argument is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <_verible_parser_executable>>"
    exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$1" ]; then
    echo "$1 is not a directory"
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "$2 does not exist or is not a file"
    exit 1
fi

count=1
total=$(($(find "$1" -type f | wc -l)))
total=$(($total-1))

echo "total of programs: $total"

#shopt -s globstar

for file in $(find  "$1"/ -name "*.v" -type f)  ; do

    if [[ ! -f "$file" ]]; then
     continue; 
    fi

    echo "Analyzing $count/$total: $file"    
    "$2" "$file"  2>&1 


    ((count++))
done

