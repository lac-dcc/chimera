#!/bin/bash

sh autoconf.sh

CC=/bin/clang \
  CXX=/bin/clang++ \
  CC_FOR_BUILD=/bin/clang \
  CFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  CFLAGS_FOR_BUILD="-fprofile-instr-generate -fcoverage-mapping" \
  CTARGETFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  CXXFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  LDFLAGS_FOR_BUILD="-fprofile-instr-generate -fcoverage-mapping" \
  LDFLAGS="-fprofile-instr-generate -fcoverage-mapping" \
  ./configure

make clean

make -j $(nproc)
