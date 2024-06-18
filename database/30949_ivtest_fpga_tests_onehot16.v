// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module onehot16(output wire [15:0] out, input wire [3:0] A);

   assign out = 1 << A;

endmodule
