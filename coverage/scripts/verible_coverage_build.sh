#!/bin/bash

bazel clean

CC=/bin/clang CXX=/bin/clang++ bazel build -c dbg \
  --copt=-fprofile-instr-generate \
  --copt=-fcoverage-mapping \
  --linkopt=-fprofile-instr-generate \
  --linkopt=-fcoverage-mapping \
  //verible/verilog/tools/syntax:verible-verilog-syntax \
  //verible/verilog/tools/formatter:verible-verilog-format \ 
//verible/verilog/tools/obfuscate:verible-verilog-obfuscate
