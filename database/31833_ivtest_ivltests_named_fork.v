// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  initial fork : named_fork
    $display("PASSED");
  join : named_fork
endmodule
