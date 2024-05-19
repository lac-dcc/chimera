// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  parameter rep = 4'bx;

  wire [31:0] b = {rep{8'hab}}; // This should be a compilation error.

  initial $display("FAILED");
endmodule
