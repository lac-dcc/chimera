// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test_unknown_in_always_star;
reg [2:0] x;
always @* x = {unknown, 1'b0};
endmodule
