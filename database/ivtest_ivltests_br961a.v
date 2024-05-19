// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Check the compiler fails gracefully
module test;

function [w-1:0] copy;

input [w-1:0] z;

begin
  copy = z;
end

endfunction

endmodule
