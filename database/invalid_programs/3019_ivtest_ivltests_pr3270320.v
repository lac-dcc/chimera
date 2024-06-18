// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

function [7:0] dup;

input [7:0] i;

begin
  dup = i;
end

endfunction

wire [7:0] a;

assign a = dup(missing);

endmodule
