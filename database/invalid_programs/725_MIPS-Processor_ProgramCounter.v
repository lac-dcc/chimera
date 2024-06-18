// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

`include "DFF.v"

module ProgamCounter(out, in, clk, reset);
	input [31:0] in;
	input  reset, clk;
	output [31:0] out;
	genvar j;
	
	generate for (j = 0; j < 32; j = j + 1) begin: reg_loop
			dff_async_clear d(out[j], in[j], clk, reset);
		end
	endgenerate
	
endmodule