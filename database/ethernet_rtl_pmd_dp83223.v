// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2022 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"
`include "io.vh"

`timescale 1ns/1ps

module pmd_dp83223 (
	input clk_250,
	input clk_125,

	/* I/O */
	input indicate_data,
	input signal_detect,
	output reg request_data,

	/* "PMD" */
	input tx_data,
	output [1:0] rx_data,
	output [1:0] rx_data_valid,
	output reg signal_status,

	/* Control */
	input loopback
);

	wire tx_nrzi;

	nrzi_encode encoder (
		.clk(clk_125),
		.nrz(tx_data),
		.nrzi(tx_nrzi)
	);

`ifdef SYNTHESIS
	SB_IO #(
		.PIN_TYPE(`PIN_OUTPUT_ALWAYS | `PIN_OUTPUT_REGISTERED),
	) tx_data_pin (
		.PACKAGE_PIN(request_data),
		.OUTPUT_CLK(clk_125),
		.D_OUT_0(loopback ? 1'b0 : tx_nrzi)
	);
`else
	always @(posedge clk_125)
		request_data <= loopback ? 1'b0 : tx_nrzi;
`endif

	wire signal_status_nrzi;
	wire [1:0] rx_nrzi, rx_nrzi_valid;

	pmd_dp83223_rx rx (
		.clk_125(clk_125),
		.clk_250(clk_250),

		.signal_detect(signal_detect),
		.indicate_data(indicate_data),

		.signal_status(signal_status_nrzi),
		.rx_data(rx_nrzi),
		.rx_data_valid(rx_nrzi_valid)
	);

	nrzi_decode decoder (
		.clk(clk_125),
		.rst(loopback ? 1'b0 : !signal_status_nrzi),
		.nrzi(loopback ? { tx_nrzi, 1'bX } : rx_nrzi),
		.nrzi_valid(loopback ? 2'b01 : rx_nrzi_valid),
		.nrz(rx_data),
		.nrz_valid(rx_data_valid)
	);

	initial signal_status = 0;
	always @(posedge clk_125)
		signal_status <= loopback ? 1'b1 : signal_status_nrzi;

endmodule
