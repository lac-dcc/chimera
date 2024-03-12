/*
 * iua_phy.v
 *
 * ice40 USB Analyzer - PHYsical interface
 *
 * Copyright (C) 2008  Sylvain Munaut <tnt@246tNt.com>
 *
 * vim: ts=4 sw=4
 */

`ifdef SIM
`default_nettype none
`endif

module iua_phy (
	input  wire pad,
	output wire [1:0] cap,
	input  wire clk
);

	wire [1:0] cap_i;
	reg  [1:0] cap_r;

	// IO Cell
	SB_IO #(
		.PIN_TYPE(6'b000000),
		.PULLUP(1'b0),
		.NEG_TRIGGER(1'b0),
		.IO_STANDARD("SB_LVCMOS")
	) io_I (
		.PACKAGE_PIN(pad),
		.LATCH_INPUT_VALUE(1'b0),
		.CLOCK_ENABLE(1'b1),
		.INPUT_CLK(clk),
		.OUTPUT_CLK(clk),
		.OUTPUT_ENABLE(1'b0),
		.D_OUT_0(1'b0),
		.D_OUT_1(1'b0),
		.D_IN_0(cap_i[0]),
		.D_IN_1(cap_i[1])
	);

	// Re-register everything on the rising edge
	always @(posedge clk)
		cap_r <= cap_i;

	assign cap = cap_r;

endmodule // iua_phy
