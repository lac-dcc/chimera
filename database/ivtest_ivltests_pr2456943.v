// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  wire real test;

  initial begin
    if (test != 0.0) $display("FAILED");
    else $display("PASSED");
  end
endmodule
