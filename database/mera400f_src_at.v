// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// ALU output register (AT)

module at(
	input clk_sys,
	input s0, s1,
	input c,
	input sl,
	input [0:15] f,
	output reg [0:15] at
);

	always @ (posedge clk_sys) begin
		if (c) case ({s1, s0})
			2'b00 : at <= at;
			2'b01 : at <= {sl, at[0:14]};
			2'b10 : at <= at; // NOTE: shouldn't happen (by design). In real CPU it would shift "0" on the right side of each quad-bit
			2'b11 : at <= f;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
