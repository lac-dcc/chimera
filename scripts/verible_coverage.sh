#!/bin/bash

if [ $# -gt 2 ]; then
  >&2 echo "Usage: $0 <_verible_tool_executable> [worklist]"
  exit 1
fi

if [ ! -f "$1" ]; then
  >&2 echo "$1 does not exist or is not a file"
  exit 1
fi

if [ $# -eq 2 -a ! -f "$2" ]; then
  >&2 echo "$2 does not exist or is not a file"
  exit 1
fi

verible_exe="$1"
is_obfuscate=false
if [[ $verible_exe == *"obfuscate" ]]; then
  is_obfuscate=true
fi

echo "file,line_coverage,branch_coverage"

run_coverage() {
  >&2 echo "$1"

  profraw_file="$(basename "$1").profraw"
  profdata_file="$(basename "$1").profdata"

  if [ $is_obfuscate = true ]; then
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" < "$1" > /dev/null 2>&1
  else
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" "$1"
  fi

  llvm-profdata merge -sparse "$profraw_file" -o "$profdata_file"

  # Generate report and check which programs have either "0.00%" or "-" in all
  # coverage columns
  non_used_files=$(llvm-cov report --ignore-filename-regex="external/*" \
                    "$verible_exe" -instr-profile="$profdata_file" | \
                    grep -P '^(?=(.*?(\b0\.00%|-)){4})(?!.*(0\.00%|-){5})' | \
                    awk '{print $1}')

  ignore_options=$(printf -- '--ignore-filename-regex="%s" ' $non_used_files)

  # Generate the report again, but ignore all programs with 0% coverage in all
  # columns
  summary=$(eval llvm-cov report "$ignore_options" \
                  --ignore-filename-regex="external/*" \
                  "$verible_exe" -instr-profile="$profdata_file" | \
                  tail -1)
  
  line_coverage=$(echo "$summary" | awk '{print $(NF-3)}')
  branch_coverage=$(echo "$summary" | awk '{print $(NF)}')

  # Output the total line coverage and the total branch coverage
  echo "$1,${line_coverage::-1},${branch_coverage::-1}"

  rm "$profraw_file" "$profdata_file"
}

if [ $# -eq 1 ]; then
  for input in ../database/*.v; do
    run_coverage "$input" &
  done

  wait
else
  while IFS="" read -r input || [ -n "$input" ]; do
    run_coverage "$input" &
  done < $2

  wait
fi
