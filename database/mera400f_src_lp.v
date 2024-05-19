// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module lp(
	input clk_sys,
	input lp_clk,
	input lpb_s,
	input lpa_s,
	input lpab_r,
	output [0:1] out,
	output lp, lp1, lp2, lp3
);

/*
	preload:
		@lpb_s (10):
			@start * mw
			@f2 * mw*~fwz
		@lpa_s (01):
			@start * ~mw
			@f2 * ~mw
		@lpab_r (00):
			@f2 * fwz * mw
			@f4 * (~dw|fwz)
			@f7
	lp+1:
		@f13, @strob1b
		@f3, @strob1b
		@f1, @strob1b
		@f8, @strob1b lp*dw
*/

	always @ (posedge clk_sys) begin
		if (lp_clk) out <= out + 2'b1;
		else if (lpa_s) out <= 2'b01;
		else if (lpab_r) out <= 2'b00; // if this one is last tp.asm fails with "UPLOAD FAILED"
		else if (lpb_s) out <= 2'b10;
	end

	assign lp = (out != 0);
	assign lp1 = (out == 1);
	assign lp2 = (out == 2);
	assign lp3 = (out == 3);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
