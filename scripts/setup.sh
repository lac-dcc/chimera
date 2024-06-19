#!/bin/bash

function display_usage {
  echo >&2 "\
Usage: $(basename $0) [-d] [-j N]

Options:
    -d       Build in debug mode.
    -j N     Number of jobs for building with make.
    -h       Display this help message and exit.\
"
}

build_type="Release"
n_jobs="8"

while getopts ':dj:h' opt; do
  case "$opt" in
  d)
    build_type="Debug"
    ;;
  j)
    n_jobs="$OPTARG"
    ;;
  h)
    display_usage
    exit 0
    ;;
  : | ?)
    display_usage
    exit 1
    ;;
  esac
done

cmake -S src -B build/ -DCMAKE_BUILD_TYPE="$build_type"
make -j "$n_jobs" -C build/
