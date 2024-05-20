// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module k(
	input lkb,
	input f9,
	input [0:39] sum,
	input [0:39] m,
	input [0:15] w,
	output [0:39] k
);

	always @ (*) begin
		case ({lkb, f9})
			2'b00: k <= sum;
			2'b01: k <= m;
			2'b10: k <= {w[0:15], w[0:15], w[0:7]};
			2'b11: k <= 40'd0;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
