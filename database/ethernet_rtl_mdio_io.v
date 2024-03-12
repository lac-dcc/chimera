// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"
`include "io.vh"

module mdio_io (
	input clk,

	input mdc,
	inout mdio,
	output reg mdio_oe,

	input mdo,
	input mdo_valid,
	output reg ce,
	output reg mdi
);

	wire ce_next;
	reg mdi_next;
	reg [1:0] last_mdc;
	/* Two clock delay to allow the level shifter to reverse direction */
	reg [2:0] oe;
	initial oe = 0;

`ifdef SYNTHESIS
	SB_IO #(
		.PIN_TYPE(`PIN_OUTPUT_NEVER | `PIN_INPUT_REGISTERED)
	) mdc_pin (
		.PACKAGE_PIN(mdc),
		.INPUT_CLK(clk),
		.D_IN_0(last_mdc[0])
	);

	SB_IO #(
		.PIN_TYPE(`PIN_OUTPUT_REGISTERED | `PIN_OUTPUT_ENABLE | `PIN_INPUT_REGISTERED)
	) mdio_pin (
		.PACKAGE_PIN(mdio),
		.INPUT_CLK(clk),
		.OUTPUT_CLK(clk),
		.OUTPUT_ENABLE(oe[2]),
		.D_OUT_0(mdo),
		.D_IN_0(mdi_next),
	);

	SB_IO #(
		.PIN_TYPE(`PIN_OUTPUT_ALWAYS | `PIN_OUTPUT_REGISTERED)
	) mdio_oe_pin (
		.PACKAGE_PIN(mdio_oe),
		.OUTPUT_CLK(clk),
		.D_OUT_0(mdo_valid),
	);
`else
	reg mdio_next;

	always @(posedge clk) begin
		last_mdc[0] <= mdc;
		mdi_next <= mdio;
		mdio_next <= mdo;
		mdio_oe <= mdo_valid;
	end

	assign mdio = oe[2] ? mdio_next : 1'bZ;
`endif

	assign ce_next = last_mdc[0] && !last_mdc[1];

	always @(posedge clk) begin
		mdi <= mdi_next;
		last_mdc[1] <= last_mdc[0];
		ce <= ce_next;
		if (mdo_valid)
			oe <= { oe[1:0], mdo_valid };
		else
			oe <= 0;
	end

endmodule
