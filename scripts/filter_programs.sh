#!/bin/bash

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
total=$(($(find "$1"/ -name "*.v" -type f | wc -l)))
total=$(($total-1))

echo "total of programs: $total"

mkdir "$1/verible_invalid_programs"

for file in $(find  "$1"/ -name "*.v" -type f)  ; do

    if [[ ! -f "$file" ]]; then
     continue; 
    fi

    if [ ! -s "$file" ]; then
        mv "$file" "$1/verible_invalid_programs"
        >&2 echo "Blank File: $file" 

    echo "Analyzing $count/$total: $file"    
    "$2" "$file"  2>&1 >/dev/null

    if [ $? -eq 1 ]
        mv "$file" "$1/verible_invalid_programs"
        >&2 echo "Error at file: $file"
    fi


    ((count++))
done

