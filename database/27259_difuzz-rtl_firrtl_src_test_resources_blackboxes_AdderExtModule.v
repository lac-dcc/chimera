// This program was cloned from: https://github.com/compsec-snu/difuzz-rtl
// License: BSD 3-Clause "New" or "Revised" License

// See LICENSE for license details.
module AdderExtModule(
  input [15:0] foo,
  output [15:0] bar
);
  assign bar = foo + 1;
endmodule

