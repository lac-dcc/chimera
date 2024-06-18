// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// User registers

module regs(
	input clk_sys,
	input [0:15] w,
	input [0:2] addr,
	input we,
	output [0:15] l
);

	reg [0:15] mem [0:7];

	always @ (posedge clk_sys) begin
		if (we) mem[addr] <= w;
	end

	assign l = mem[addr];

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
