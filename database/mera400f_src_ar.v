// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Address register (AR)

module ar(
	input clk_sys,
	input p1,
	input m4,
	input l,
	input [0:15] w,
	output arz,
	output reg [0:15] ar
);

	always @ (posedge clk_sys) begin
		if (l) ar <= w;
		else begin
			if (m4) ar <= ar - 3'd4;
			else if (p1) ar <= ar + 1'b1;
		end
	end

	assign arz = ~|ar[0:7];

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
