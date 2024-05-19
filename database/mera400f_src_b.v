// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module b(
	input clk_sys,
	input f2strob,
	input [0:7] d,
	input fcb,
	input scc,
	output b0,
	output [0:7] b
);

	reg [0:7] b_reg;
	always @ (posedge clk_sys) begin
		if (f2strob) b_reg <= d;
	end

	assign b0 = b_reg[0];

	always @ (*) begin
		case ({fcb, scc})
			2'b00: b <= ~b_reg;
			2'b01: b <= b_reg;
			2'b10: b <= 8'hff;
			2'b11: b <= 8'h00;
		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
