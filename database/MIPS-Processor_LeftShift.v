// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

module LeftShift(out, in);
	input [31:0] in;
	output [31:0] out;
	assign out = {in[29:0], 1'b0, 1'b0};
endmodule