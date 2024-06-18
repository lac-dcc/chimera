// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`define _variable 1

module top;
  initial begin
    if (`_variable == 1) $display("PASSED");
    else $display("Fail");
  end
endmodule
