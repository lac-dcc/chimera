// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;

  initial begin
    // In SystemVerilog a function is not required to return a value or
    // to take an argument.
    test_fcn();
    $display("PASSED");
  end

  function bit test_fcn();
    test_fcn = 1'b1;
  endfunction

endmodule
