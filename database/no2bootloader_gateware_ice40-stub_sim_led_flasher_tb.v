/*
 * led_flasher_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module led_flasher_tb;

	// Signals
	// -------

	reg clk = 1'b0;
	reg rst = 1'b1;

	reg  go = 1'b0;
	wire rdy;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("led_flasher_tb.vcd");
		$dumpvars(0,led_flasher_tb);
		# 2000000 $finish;
	end

	always #10 clk <= !clk;

	initial begin
		#200 rst = 0;
	end


	// DUT
	// ---

	led_flasher #(
		.DW(5)
	) dut_I (
		.led       (),
		.flash_cnt (4'h2),
		.clk       (clk),
		.rst       (rst)
	);

endmodule // led_flasher_tb
