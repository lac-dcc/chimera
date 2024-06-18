// This program was cloned from: https://github.com/Yvan-xy/verilog-doc
// License: GNU General Public License v2.0

module top_module (
	input [99:0] in,
	output [98:0] out_both,
	output [99:1] out_any,
	output [99:0] out_different
);

	// See gatesv for explanations.
	assign out_both = in & in[99:1];
	assign out_any = in[99:1] | in ;
	assign out_different = in ^ {in[0], in[99:1]};
	
endmodule
