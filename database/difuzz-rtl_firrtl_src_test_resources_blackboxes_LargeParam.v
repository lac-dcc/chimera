// This program was cloned from: https://github.com/compsec-snu/difuzz-rtl
// License: BSD 3-Clause "New" or "Revised" License

// See LICENSE for license details.
module LargeParam #(parameter DATA=0, WIDTH=1) (
  output [WIDTH-1:0] out
);
  assign out = DATA;
endmodule

