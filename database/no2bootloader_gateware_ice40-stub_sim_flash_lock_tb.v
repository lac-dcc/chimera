/*
 * flash_lock_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module flash_lock_tb;

	// Signals
	// -------

	reg clk = 1'b0;
	reg rst = 1'b1;

	reg  go = 1'b0;
	wire rdy;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("flash_lock_tb.vcd");
		$dumpvars(0,flash_lock_tb);
		# 2000000 $finish;
	end

	always #10 clk <= !clk;

	initial begin
		#200 rst = 0;
		#301 go = 1;
		#321 go = 0;
	end


	// DUT
	// ---

	flash_lock dut_I (
		.go(go),
		.rdy(rdy),
		.clk(clk),
		.rst(rst)
	);

endmodule // flash_lock_tb
