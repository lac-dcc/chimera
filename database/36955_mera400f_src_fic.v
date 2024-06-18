// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

/*
	AWP FIC register

	document: 12-006370-01-4A
	unit:     F-PM2-2
	pages:    2-20
*/

module fic(
	input clk_sys,
	input cda,
	input cua,
	input rab,
	input load,
	input [0:5] in,
	output fic
);

	reg [0:5] cnt;

	always @ (posedge clk_sys, posedge rab) begin
		if (rab) cnt <= 0;
		else if (load) cnt <= in;
		else if (cda) cnt <= cnt - 1'd1;
		else if (cua) cnt <= cnt + 1'd1;
	end

	assign fic = |cnt;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
