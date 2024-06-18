// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  integer in;

  initial begin
    in = 2;
    if ($clog2(in) != 1) $display("FAILED");
    else $display("PASSED");
  end
endmodule
