// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  // This should be a compilation error.
  parameter PARAMB = PARAMB + 6;

  initial $display("FAILED");
endmodule
