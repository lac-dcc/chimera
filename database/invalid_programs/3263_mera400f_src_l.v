// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// L bus (user registers output)

module l(
	input [0:15] r0,
	input [0:15] rn,
	input [0:1] sel,
	output [0:15] l
);

	always @ (*) begin
		case (sel)
			2'b00: l = r0;
			2'b01: l = rn;
			2'b10: l = {8'd0, r0[0:7]};
			2'b11: l = {8'd0, r0[0:7]};
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
