// This program was cloned from: https://github.com/cslab-chosun/online-fuzzy-chisel
// License: GNU General Public License v3.0

module Comparator(
  input  [6:0] io_in1,
  input  [6:0] io_in2,
  output       io_maxMin
);
  assign io_maxMin = io_in1 >= io_in2 ? 1'h0 : 1'h1; // @[comparator.scala 34:26 37:20 45:20]
endmodule
