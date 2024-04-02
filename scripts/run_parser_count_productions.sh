#!/bin/bash

# This script runs the executable of the parser passed as argument, we recommend verible's parser, and extracts the trace file. We use it 
# as input for the count_productions.py script.

# Check if directory argument is provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <_verible_parser_executable> <output_file>"
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
total=$(($(ls $1/ -l | wc -l)))
total=$(($total-1))
echo "total of programs: $total"
for file in  "$1"/*.v; do

    echo "Analyzing $count/$total: $file"
    "$2" --verilog_trace_parser "$file" 2> aux.txt

    #echo $out

    if [ $? -ne 1 ]
    then
        echo "Analyzing $count/$total: $file"
        python3 count_productions.py --output_file $3 < aux.txt
    
    else
        echo "Error at file: $file"
        
    fi
    
    rm -f aux.txt
    ((count++))
done

