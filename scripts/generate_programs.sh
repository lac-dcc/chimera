#!/bin/bash

# This script runs the executable of the parser passed as argument, we recommend verible's parser, and extracts the trace file. We use it 
# as input for the count_productions.py script.

# Check if directory argument is provided

if [ $# -ne 7 ]; then
    >&2 echo "Usage: $0 <directory> <chimera_executable> <json_file> <n_gram> <number of programs to generate> <path_to_formatter> <target_size>"
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

if [ ! -f "$3" ]; then
    >&2 echo "$3 does not exist or is not a file"
    exit 1
fi


for (( i=1; i<=$5; i++ )) do
    file="verilog_file_$i.v"

    "$2" "--printseed" "-t" "$7" "$3" "$4" > "${1}/${4}_gram_${file}"

    #format file
    "$6" "--inplace" "--failsafe_success=false"  "${1}/${4}_gram_${file}"

    if [ $? -ne 0 ]
    then
        ((i--))
   
        rm "${1}/${4}_gram_${file}"
    fi
    
done
