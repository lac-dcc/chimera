#!/bin/bash

display_usage() {
  >&2 echo "\
Usage: $0 <_verible_tool_executable> [-h|--help] [-f|--file FILE] [-i|--incremental]

Options:
  -f, --file FILE        Specifies a file with a list of paths to be used for coverage instead of getting programs from "../database".
  -i, --incremental      Indicates that coverate should start at the first program and keep previous profilings for the next coverages.
  -h, --help             Display this help message and exit.\
"
}

incremental=false

# Argument parsing
while [[ $# -gt 0 ]]; do
  case "$1" in
  -i | --incremental)
    incremental=true
    shift
    ;;
  -f | --file)
    if [ $# -lt 2 -o ! -f "$2" ]; then
      >&2 echo "Invalid value for \"$1\" option"
      exit 1
    fi
    file=$2
    shift 2
    ;;
  -h | --help)
    display_usage
    exit 0
    ;;
  -* | --*)
    echo "Invalid option '$1'"
    echo "Use $0 --help for more information."
    exit 1
    ;;
  *)
    if [ ! -z "$verible_exe" ]; then
      display_usage
      exit 1
    fi
    verible_exe="$1"
    shift
    ;;
  esac
done

if [ -z "$verible_exe" ]; then
  display_usage
  exit 1
fi

if [ ! -f "$verible_exe" ]; then
  >&2 echo "$verible_exe does not exist or is not a file"
  exit 1
fi

is_obfuscate=false
if [[ $verible_exe == *"obfuscate" ]]; then
  is_obfuscate=true
fi

printf "file,line_coverage,branch_coverage"
[ $incremental = true ] && printf ",num_files"
printf "\n"

profraw_files=()
run_coverage() {
  >&2 echo "$1"

  profraw_file="$(basename "$1").profraw"
  profdata_file="$(basename "$1").profdata"

  if [ $is_obfuscate = true ]; then
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" < "$1" > /dev/null 2>&1
  else
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" "$1"
  fi

  if [ $incremental = true ]; then
    profraw_files+=("$profraw_file")
    eval llvm-profdata merge -sparse "${profraw_files[@]}" -o "$profdata_file"
  else
    llvm-profdata merge -sparse "$profraw_file" -o "$profdata_file"
  fi

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
  # If "incremental" is set, also output the number of files
  printf "$1,${line_coverage::-1},${branch_coverage::-1}"
  [ $incremental = true ] && printf ",${#profraw_files[@]}"
  printf "\n"

  [ $incremental = false ] && rm "$profraw_file"
  rm "$profdata_file"
}

if [ -z "$file" ]; then
  for input in ../database/*.v; do
    if [ $incremental = false ]; then
      run_coverage "$input" &
    else
      run_coverage "$input"
    fi
  done

  [ $incremental = false ] && wait || rm *.profraw
else
  while IFS="" read -r input || [ -n "$input" ]; do
    if [ $incremental = false ]; then
      run_coverage "$input" &
    else
      run_coverage "$input"
    fi
  done < $file

  [ $incremental = false ] && wait || rm *.profraw
fi
