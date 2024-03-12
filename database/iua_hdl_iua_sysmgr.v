/*
 * iua_sysmgr.v
 *
 * ice40 USB Analyzer - Clock / Reset generation
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_sysmgr #(
	parameter DIVR = 4'b0000,			// DIVR =  0
	parameter DIVF = 7'b1001111,		// DIVF = 79
	parameter DIVQ = 3'b100,			// DIVQ =  4
	parameter FILTER_RANGE = 3'b001		// FILTER_RANGE = 1
)(
	// Input
	input wire clk_in,
	input wire rst_in,

	// Output
	output wire clk_out,
	output wire rst_out
);
	// Signals
	wire clk_in_i;
	wire clk_out_i;

	wire pll_lock;
	wire pll_reset_n;
	reg [3:0] pll_reset_cnt = 0;

	reg [3:0] logic_reset_cnt;
	reg logic_rst;

	// PLL instance

`ifdef SIM
	assign clk_in_i  = clk_in;
	assign clk_out_i = clk_in;
	assign pll_lock  = pll_reset_n;
`else
	SB_PLL40_2_PAD #(
		.DIVR(DIVR),
		.DIVF(DIVF),
		.DIVQ(DIVQ),
		.FILTER_RANGE(FILTER_RANGE),
		.FEEDBACK_PATH("SIMPLE"),
		.DELAY_ADJUSTMENT_MODE_FEEDBACK("FIXED"),
		.FDA_FEEDBACK(4'b0000),
		.SHIFTREG_DIV_MODE(2'b00),
		.PLLOUT_SELECT_PORTB("GENCLK"),
		.ENABLE_ICEGATE_PORTA(1'b0),
		.ENABLE_ICEGATE_PORTB(1'b0)
	) pll_I(
		.PACKAGEPIN(clk_in),
		.PLLOUTCOREA(clk_in_i),
		.PLLOUTCOREB(),
		.PLLOUTGLOBALA(),
		.PLLOUTGLOBALB(clk_out_i),
		.EXTFEEDBACK(1'b0),
		.DYNAMICDELAY(8'h00),
		.RESETB(pll_reset_n),
		.BYPASS(1'b0),
		.LATCHINPUTVALUE(1'b0),
		.LOCK(pll_lock),
		.SDI(1'b0),
		.SDO(),
		.SCLK(1'b0)
	);
`endif

	assign clk_out = clk_out_i;

	// PLL reset generation
	always @(posedge clk_in_i)
		if (rst_in)
			pll_reset_cnt <= 0;
		else if (!pll_reset_cnt[3])
			pll_reset_cnt <= pll_reset_cnt + 1;

	assign pll_reset_n = pll_reset_cnt[3];

	// Logic reset generation
	always @(posedge clk_out_i)
		if (!pll_lock)
			logic_reset_cnt <= 0;
		else if (!logic_reset_cnt[3])
			logic_reset_cnt <= logic_reset_cnt + 1;

	always @(posedge clk_out_i)
		logic_rst <= ~logic_reset_cnt[3];

	// Force global driver for the logic reset line
	SB_GB rst_gb_I (
		.USER_SIGNAL_TO_GLOBAL_BUFFER(logic_rst),
		.GLOBAL_BUFFER_OUTPUT(rst_out)
	);

endmodule // iua_sysmgr
