// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  task foo();
    $display("PASSED");
  endtask

  initial foo;
endmodule
