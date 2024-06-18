// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Binary load register (RB)

module rb(
	input clk_sys,
	input [10:15] w,
	input w_rba,
	input w_rbb,
	input w_rbc,
	output reg [0:15] rb
);

	always @ (posedge clk_sys) begin
		if (w_rbc) rb[0:3] <= w[12:15];
		if (w_rbb) rb[4:9] <= w[10:15];
		if (w_rba) rb[10:15] <= w[10:15];
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
