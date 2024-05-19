// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;

  initial begin
    if ("this matches" == "this\
 matches") $display("PASSED");
    else $display("FAILED");
  end

endmodule
