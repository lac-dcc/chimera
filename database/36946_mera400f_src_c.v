// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module c(
	input clk_sys,
	input [0:39] t,
	input t_c,
	input cp,
	output reg [0:39] c
);

	always @ (posedge clk_sys) begin
		if (t_c) c <= t[0:39];
		else if (cp) c <= {c[0], c[0:38]};
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
