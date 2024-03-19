/*
 * top_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module top_tb;

	// Signals
	// -------

	wire spi_mosi;
	wire spi_miso;
	wire spi_flash_cs_n;
	wire spi_clk;

	wire usb_dp;
	wire usb_dn;
	wire usb_pu;

	wire uart_rx;
	wire uart_tx;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("top_tb.vcd");
		$dumpvars(0,top_tb);
		# 2000000 $finish;
	end


	// DUT
	// ---

	top dut_I (
		.spi_mosi(spi_mosi),
		.spi_miso(spi_miso),
		.spi_flash_cs_n(spi_flash_cs_n),
		.spi_clk(spi_clk),
		.usb_dp(usb_dp),
		.usb_dn(usb_dn),
		.usb_pu(usb_pu),
		.uart_rx(uart_rx),
		.uart_tx(uart_tx),
		.rgb(),
		.clk_in(1'b0)
	);


	// Support
	// -------

	pullup(usb_dp);
	pullup(usb_dn);

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
