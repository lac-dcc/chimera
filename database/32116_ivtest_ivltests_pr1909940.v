// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire out;
//  wire in; // Adding this makes it compile.
  assign out = ~in;
  assign in = 1'b0;
  initial #1 if (out == 1'b1) $display("PASSED"); else $display("FAILED");
endmodule
