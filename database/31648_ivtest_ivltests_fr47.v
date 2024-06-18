// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Regression test for feature request #47
module test();

function [15:0] add;

input [15:0] a;
input [15:0] b;

begin
  add = a + b;
end

endfunction

reg [15:0] result;

initial begin
  result = add(1, add(4, 2));
  $display("(1+(4+2)) = %d", result);
  if (result === 7)
    $display("PASSED");
  else
    $display("FAILED");
end

endmodule
