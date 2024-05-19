// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module ge8(output wire out, input wire [7:0] A, input wire [7:0] B);

   assign out = A >= B;

endmodule
