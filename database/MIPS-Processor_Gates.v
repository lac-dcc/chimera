// This program was cloned from: https://github.com/neelkshah/MIPS-Processor
// License: GNU General Public License v3.0

module bit32And (out, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	
	assign {out} = in1 & in2;

endmodule

module bit32Or (out, in1, in2);
	input [31:0] in1, in2;
	output [31:0] out;
	
	assign {out} = in1 | in2;
	
endmodule