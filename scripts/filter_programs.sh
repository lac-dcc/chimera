#!/bin/bash

# Check if directory argument is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <verible_parser_executable>"
    exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$1" ]; then
    echo "$1 is not a directory"
    exit 1
fi

# Check if the provided argument is a file
if [ ! -f "$2" ]; then
    echo "$2 does not exist or is not a file"
    exit 1
fi

count=1
total=$(find "$1" -name "*.v" -type f | wc -l)
total=$((total - 1))

echo "Total number of programs: $total"

mkdir -p "$1/verible_invalid_programs"

for file in $(find "$1" -name "*.v" -type f); do
    if [[ ! -f "$file" ]]; then
        continue
    fi
    
    echo "Analyzing $count/$total: $file"
    "$2" "$file" --printtokens >/dev/null 2>&1
    result=$?

    if [ $result -ne 0 ]; then
        mv "$file" "$1/verible_invalid_programs"
        echo "Error at file: $file" >&2
    else
        num_linhas=$("$2" "$file" --printtokens | wc -l)
        if [ "$num_linhas" -le 3 ]; then
            mv "$file" "$1/verible_invalid_programs"
            echo "Blank File: $file" >&2
        fi
    fi

    ((count++))
done
