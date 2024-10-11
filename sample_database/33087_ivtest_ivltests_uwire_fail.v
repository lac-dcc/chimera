// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  uwire two;

  assign two = 1'b1;
  assign two = 1'b0;

  initial $display("Failed: this should be a compile time error!");
endmodule
