// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module ld(
	input clk_sys,
	input lkb,
	input _0_d,
	input l_d,
	input [-2:7] sum_c,
	input [8:15] w,
	output reg [-2:7] d
);

	wire [0:9] l;

	always @ (*) begin
		case (lkb)
			0: l <= sum_c[-2:7];
			1: l <= {w[8], w[8], w[8:15]};
		endcase
	end

	always @ (posedge clk_sys, posedge _0_d) begin
		if (_0_d) d <= 10'd0;
		else if (l_d) d <= l;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
