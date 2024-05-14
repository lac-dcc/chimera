#!/bin/bash

# This script runs the executable of the parser passed as argument, we recommend verible's parser, and extracts the trace file. We use it 
# as input for the count_productions.py script.

# Check if directory argument is provided
if [ $# -ne 4 ]; then
    >&2 echo "Usage: $0 <directory> <_verible_parser_executable> <output_file> <n>"
    exit 1
fi

# Check if the provided argument is a directory
if [ ! -d "$1" ]; then
    >&2 echo "$1 is not a directory"
    exit 1
fi

if [ ! -f "$2" ]; then
    >&2 echo "$2 does not exist or is not a file"
    exit 1
fi

count=1
total=$(($(ls $1/ -l | wc -l)))
total=$(($total-1))
>&2 echo "total of programs: $total"

mkdir "$1/verible_invalid_programs"
for file in  "$1"/*.v; do
    >&2 echo "Analyzing $count/$total: $file"
    "$2" "$file"

    if [ $? -ne 1 ]
    then
        "$2" "--verilog_trace_parser"  "$file" 2>&1 | python3 count_productions.py "$3" -n "$4"
    else
        mv "$file" "$1/verible_invalid_programs"
        >&2 echo "Error at file: $file"
    fi

    ((count++))
done
