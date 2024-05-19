// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * Make sure the degenerate case that a wire is linked to itself
 * is handled properly.
 */
module example;
   wire    w;
   assign   w = w;
   initial $display("PASSED");
endmodule
