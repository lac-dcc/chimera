// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

  initial fork
    reg a;
    a = 1'b0;
    $display("PASSED");
  join

endmodule
