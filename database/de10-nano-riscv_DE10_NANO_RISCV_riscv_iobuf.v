// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

module IOBUF(
    input I,
    input T,
    output O,
    inout IO
);

  assign IO = ~T ? I:1'bz;
  assign O = IO;

endmodule
