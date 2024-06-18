// This program was cloned from: https://github.com/compsec-snu/difuzz-rtl
// License: BSD 3-Clause "New" or "Revised" License

// See LICENSE for license details.
module ParameterizedViaHeaderAdderExtModule(
  input [15:0] foo,
  output [15:0] bar
);
  `include "VerilogHeaderFile.vh"
  assign bar = foo + VALUE;
endmodule
