// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module top;
  reg signed [7:0] test = -1;
  integer result;

  initial begin
    result = test[7:0]; // A part select is always unsigned (1364-2001 4.5.1)!
    if (result != 32'h0ff) begin
      $display("FAILED part selects are unsigned, got %h, expected 32'h0ff", result);
    end else  $display("PASSED");
  end
endmodule
