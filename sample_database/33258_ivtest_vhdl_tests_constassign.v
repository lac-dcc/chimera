// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// A very simple test to check continuous assignment
// of a constant
module main();
  wire p;

  assign p = 1;

  initial begin
    #1;
    if (p == 1)
      $display("PASSED");
    else
      $display("FAILED");
  end

endmodule // main
