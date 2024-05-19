// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  // This should fail because XX4 is not given a constant.
  enum {VAL4, XX4 = $time} en4;

  initial $display("FAILED");
endmodule
