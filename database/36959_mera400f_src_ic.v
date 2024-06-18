// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Instruction counter (IC register)

module ic(
	input clk_sys,
	input cu,
	input l,
	input r,
	input [0:15] w,
	output reg [0:15] ic
);

	always @ (posedge clk_sys, posedge r) begin
		if (r) ic <= 16'd0;
		else if (l) ic <= w;
		else if (cu) ic <= ic + 1'b1;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
