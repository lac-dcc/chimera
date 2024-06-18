// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  // This should fail because XX5 is given an undefined constant (2-state).
  enum {VAL5, XX5 = 'bx} en5;

  initial $display("FAILED");
endmodule
