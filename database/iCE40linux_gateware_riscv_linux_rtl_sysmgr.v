/*
 * sysmgr.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module sysmgr (
	input  wire [3:0] delay,
	input  wire clk_in,
	output wire clk_1x,
	output wire clk_4x,
	output wire clk_rd,
	output wire sync_4x,
	output wire sync_rd,
	output wire rst
);

	wire pll_lock;

	SB_PLL40_2F_PAD #(
		.FEEDBACK_PATH("SIMPLE"),
		.DIVR(4'b0000),
`ifdef OVERCLOCK
		.DIVF(7'b0110100),
		.DIVQ(3'b011),
`else
		.DIVF(7'b1001111),
		.DIVQ(3'b100),
`endif
		.FILTER_RANGE(3'b001),
		.DELAY_ADJUSTMENT_MODE_RELATIVE("DYNAMIC"),
		.FDA_RELATIVE(15),
		.SHIFTREG_DIV_MODE(0),
		.PLLOUT_SELECT_PORTA("GENCLK"),
		.PLLOUT_SELECT_PORTB("GENCLK")
	) pll_I (
		.PACKAGEPIN(clk_in),
		.DYNAMICDELAY({delay, 4'h0}),
		.PLLOUTGLOBALA(clk_rd),
		.PLLOUTGLOBALB(clk_4x),
		.RESETB(1'b1),
		.LOCK(pll_lock)
	);

	ice40_serdes_crg #(
		.NO_CLOCK_2X(1)
	) crg_I (
		.clk_4x(clk_4x),
		.pll_lock(pll_lock),
		.clk_1x(clk_1x),
		.rst(rst)
	);

	ice40_serdes_sync #(
		.PHASE(2),
		.NEG_EDGE(0),
		.GLOBAL_BUF(0),
		.LOCAL_BUF(1),
		.BEL_COL("X12"),
		.BEL_ROW("Y15")
	) sync_4x_I (
		.clk_slow(clk_1x),
		.clk_fast(clk_4x),
		.rst(rst),
		.sync(sync_4x)
	);

`ifdef MEM_HRAM
	ice40_serdes_sync #(
		.PHASE(2),
		.NEG_EDGE(0),
		.GLOBAL_BUF(0),
		.LOCAL_BUF(1),
		.BEL_COL("X13"),
		.BEL_ROW("Y15")
	) sync_rd_I (
		.clk_slow(clk_1x),
		.clk_fast(clk_rd),
		.rst(rst),
		.sync(sync_rd)
	);
`endif

endmodule
