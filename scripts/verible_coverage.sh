#!/bin/bash

# This script is used to obtain coverage for Verible's tools. It can support
# both verible-verilog-syntax and verible-verilog-obfuscate. In order to make it
# work properly, you must compile the target Verible tool with Clang's
# source-based coverage (https://clang.llvm.org/docs/SourceBasedCodeCoverage.html#compiling-with-coverage-enabled).

# "Incremental" means that all considered files contribute to coverage. Thus, if
# the script is run without the -i argument, the output will tell the coverage
# that is obtained by running the Verible tool for each individual file.

# The script outputs the results in CSV format to the standard output.

display_usage() {
  >&2 echo "\
Usage: $0 <_verible_tool_executable> [-h|--help] [-d|--dir DIRECTORY] [-f|--file FILE] [-i|--incremental]

Options:
  -d, --dir DIRECTORY  Specifies the directory where files used for coverage will be taken from. Default is "../database"
  -f, --file FILE      Specifies a file with a list of paths to be used for coverage instead of getting programs from a directory.
  -i, --incremental    Indicates that coverate should start at the first program and keep previous profilings for the next coverages.
  -h, --help           Display this help message and exit.\
"
}

incremental=false
target_dir="../database"

# Argument parsing
while [[ $# -gt 0 ]]; do
  case "$1" in
  -i | --incremental)
    incremental=true
    shift
    ;;
  -d | --dir)
    if [ $# -lt 2 -o ! -d "$2" ]; then
      >&2 echo "Invalid value for \"$1\" option"
      exit 1
    fi
    target_dir=$2
    shift 2
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

profdata_files=()
prev_profdata=""
run_coverage() {
  >&2 echo "$1"

  profraw_file="$(basename "$1").profraw"
  profdata_file="$(basename "$1").profdata"

  if [ $is_obfuscate = true ]; then
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" < "$1" > /dev/null 2>&1
  else
    LLVM_PROFILE_FILE=$profraw_file "$verible_exe" "$1" > /dev/null 2>&1
  fi

  if [ $incremental = true ] && [ -f "$prev_profdata" ]; then
    llvm-profdata merge -sparse "$profraw_file" "$prev_profdata" -o "$profdata_file"
  else
    llvm-profdata merge -sparse "$profraw_file" -o "$profdata_file"
  fi

  summary=$(llvm-cov report --ignore-filename-regex="external/*" \
                  "$verible_exe" -instr-profile="$profdata_file" | \
                  tail -1)
  
  line_coverage=$(echo "$summary" | awk '{print $(NF-3)}')
  branch_coverage=$(echo "$summary" | awk '{print $(NF)}')

  # Output the total line coverage and the total branch coverage
  # If "incremental" is set, also output the number of files
  printf "$1,${line_coverage::-1},${branch_coverage::-1}"
  [ $incremental = true ] && printf ",$2"
  printf "\n"

  rm "$profraw_file"
  if [ $incremental = false ]; then
    rm "$profdata_file"
  elif [ -f "$prev_profdata" ]; then
    rm "$prev_profdata"
  fi
  prev_profdata=$profdata_file
}

run_coverage_for_program() {
  if [ $incremental = false ]; then
    run_coverage "$1" "$2" &
  else
    run_coverage "$1" "$2"
  fi
}

i=1
if [ -z "$file" ]; then
  for input in $target_dir/*.v; do
    run_coverage_for_program "$input" "$i"
    ((i++))
  done
else
  while IFS="" read -r input || [ -n "$input" ]; do
    run_coverage_for_program "$input" "$i"
    ((i++))
  done < $file
fi

[ $incremental = false ] && wait || exit
