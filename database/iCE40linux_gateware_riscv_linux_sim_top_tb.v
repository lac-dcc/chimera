/*
 * top_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`timescale 1 ns / 100 ps
`default_nettype none

module top_tb;

	// Signals
	// -------

	wire spi_mosi;
	wire spi_miso;
	wire spi_flash_cs_n;
	wire spi_clk;

	wire uart_rx;
	wire uart_tx;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		# 1000000 $finish;
		# 200000000 $finish;
	end


	// DUT
	// ---

	top dut_I (
		.spi_mosi       (spi_mosi),
		.spi_miso       (spi_miso),
		.spi_flash_cs_n (spi_flash_cs_n),
		.spi_clk        (spi_clk),
		.uart_rx        (uart_rx),
		.uart_tx        (uart_tx),
		.btn            (1'b1),
		.clk_in         (1'b0)
	);


	// Support
	// -------

	pullup(uart_tx);
	pullup(uart_rx);

	spiflash flash_I (
		.csb(spi_flash_cs_n),
		.clk(spi_clk),
		.io0(spi_mosi),
		.io1(spi_miso),
		.io2(),
		.io3()
	);

endmodule // top_tb
