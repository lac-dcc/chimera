// This program was cloned from: https://github.com/trabucayre/fpgalibs
// License: MIT License

/*
 * gatemate_25MHz_125MHz_pll.v
 *
 * Copyright (C) 2022  Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
 * SPDX-License-Identifier: MIT
 */

module divide_5 (
	input  clk_i,
	output clk_o
);
	wire d2, d1, d0, q2bar, q1bar, q0bar;
	reg  q2 = 0, q1 = 0, q0 = 0, q2temp = 0;

	assign q2bar = ~q2;
	assign q1bar = ~q1;
	assign q0bar = ~q0;

	assign d0 = (q2bar & q0bar);
	assign d1 = (q1 & q0bar) | (q1bar & q0);
	assign d2 = (q1 & q0);

	always @(posedge clk_i) begin
		q0 <= d0;
		q1 <= d1;
		q2 <= d2;
	end

	always @(negedge clk_i) begin
		q2temp <= q1;
	end

	assign clk_o = q1 | q2temp;
endmodule

module pll (
	input  wire clock_in,
	output wire clock_out,
	output wire clock_5x_out,
	output reg  lock_out
);

initial lock_out = 1'b0;

wire usr_pll_lock_stdy, usr_pll_lock;

CC_PLL #(
	.REF_CLK("10.0"),    // reference input in MHz
	.OUT_CLK("125.0"),   // pll output frequency in MHz
	.LOW_JITTER(1),      // 0: disable, 1: enable low jitter mode
	.CI_FILTER_CONST(2), // optional CI filter constant
	.CP_FILTER_CONST(4)  // optional CP filter constant
) pll125 (
	.CLK_REF(clock_in), .CLK_FEEDBACK(1'b0), .USR_CLK_REF(1'b0),
	.USR_LOCKED_STDY_RST(1'b0), .USR_PLL_LOCKED_STDY(usr_pll_lock_stdy), .USR_PLL_LOCKED(usr_pll_lock),
	.CLK270(), .CLK180(), .CLK90(), .CLK0(clock_5x_out), .CLK_REF_OUT()
);

// reset is synced the clock
reg locked_s1 = 1'b0;
always @(posedge clock_5x_out) begin
	locked_s1 <= usr_pll_lock;
	lock_out <= locked_s1;
end

divide_5 div_inst (
	.clk_i(clock_5x_out),
	.clk_o(clock_out)
);

endmodule
