// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	BAR register (bits 10-15 of SR):
	* 10: Q register
	* 11: BS register
	* 12-15: Block number register (NB)
*/

module bar(
	input clk_sys,
	input [10:15] w,
	input cnb,
	input clm,
	input zer_sp,
	output reg [0:5] bar
);

	always @ (posedge clk_sys, posedge clm) begin
		if (clm) bar <= 6'd0;
		else begin
			if (cnb) bar[1:5] <= w[11:15];
			if (zer_sp) bar[0] <= 1'b0;
			else if (cnb) bar[0] <= w[10];
		end
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
