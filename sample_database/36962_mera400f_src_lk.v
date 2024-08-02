// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Step counter (LK)

module lk(
	input clk_sys,
	input cd,
	input [0:3] i,
	input r,
	input l,
	output lk
);

	reg [0:3] cnt;

	always @ (posedge clk_sys, posedge r) begin
		if (r) cnt <= 4'd0;
		else if (l) cnt <= i;
		else if (cd) cnt <= cnt - 1'b1;
	end

	assign lk = |cnt;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
