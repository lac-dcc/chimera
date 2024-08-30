#!/bin/bash

if [ $# -ne 3 ]; then
  >&2 echo "Usage: $0 <_verible_parser_executable> <verilog_file> <n>"
  exit 1
fi

if [ ! -f "$2" ]; then
  >&2 echo "$2 does not exist or is not a file"
  exit 1
fi

filename=$(basename -- "$2")
filename="${filename%.*}"
output_json="$filename.json"
"$1" --verilog_trace_parser "$2" 2>&1 | python3 ./scripts/count_productions.py $output_json -n "$3"
