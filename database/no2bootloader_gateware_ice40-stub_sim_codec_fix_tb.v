/*
 * codec_fix_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module codec_fix_tb;

	// Signals
	// -------

	reg clk = 1'b0;
	reg rst = 1'b1;

	reg  go = 1'b0;
	wire rdy;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("codec_fix_tb.vcd");
		$dumpvars(0,codec_fix_tb);
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

	codec_fix dut_I (
		.go  (go),
		.rdy (rdy),
		.led (1'b0),
		.clk (clk),
		.rst (rst)
	);

endmodule // codec_fix_tb
