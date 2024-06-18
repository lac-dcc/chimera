// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Check that the compiler does not crash when a function is missing.
module br924();

function [3:0] func2(input [3:0] value);

  func2 = value;

endfunction

reg [3:0] x;
reg [3:0] y;

always @* begin
  y = func2(func1(x));
end

endmodule
