/*
 * dfu_helper_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2019-2020  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module dfu_helper_tb;

	// Signals
	// -------

	reg clk = 1'b0;
	reg rst = 1'b1;
	reg btn = 1'b0;


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("dfu_helper_tb.vcd");
		$dumpvars(0,dfu_helper_tb);
		# 2000000 $finish;
	end

	always #10 clk <= !clk;

	initial begin
		#200 rst = 0;
		#10000 btn = 1;
		#200000 btn = 0;
		#100000 btn = 1;
	end


	// DUT
	// ---

	dfu_helper #(
		.TIMER_WIDTH(12),
		.BTN_MODE(3),
		.DFU_MODE(0)
	) dut_I (
		.boot_sel(2'b00),
		.boot_now(1'b0),
		.btn_pad(btn),
		.btn_val(),
		.rst_req(),
		.clk(clk),
		.rst(rst)
	);

endmodule // dfu_helper_tb
