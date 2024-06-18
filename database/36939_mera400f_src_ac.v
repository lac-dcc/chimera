// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Accumulator (AC register)

module ac(
	input clk_sys,
	input c,
	input [0:15] w,
	output reg [0:15] ac
);

	always @ (posedge clk_sys) begin
		if (c) ac <= w;
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
