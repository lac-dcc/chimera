// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Interrupt mask register

module rm(
	input clk_sys,
	input clm$,
	input clrs,
	input [0:9] zi,
	input [0:15] w,
	output reg [0:9] rs
);

	genvar num;
	generate
		for (num=0 ; num<10 ; num=num+1) begin : REG_RM
			wire rm_reset = zi[num] & clm$;
			always @ (posedge clk_sys, posedge rm_reset) begin
				if (rm_reset) rs[num] <= 1'b0;
				else if (clrs) rs[num] <= w[num];
			end
		end
	endgenerate

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
