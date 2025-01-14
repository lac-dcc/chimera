#!/bin/bash

autoconf

CC=/bin/clang \
  CXX=/bin/clang++ \
  CFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  CXXFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  LDFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  ./configure

make clean

make -j $(nproc)
