// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  parameter pval = 1;

  initial $display("Concat: %d", {pval, 2});
endmodule
