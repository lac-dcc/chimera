// This program was cloned from: https://github.com/namberino/vsap-1
// License: BSD 2-Clause "Simplified" License

module clock(
	input hlt, // halt signal
	input clk_in,

	output clk_out
);

	assign clk_out = hlt ? 1'b0 : clk_in;

endmodule
