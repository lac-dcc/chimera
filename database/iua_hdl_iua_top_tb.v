/*
 * iua_top_tb.v
 *
 * ice40 USB Analyzer - Top Level testbench
 *
 * Copyright (C) 2018 Sylvain Munaut
 *
 * vim: ts=4 sw=4
 */

`default_nettype none
`timescale 1ns/1ps

module iua_top_tb;

	// Signals
	reg rst = 1;
	reg clk_48m  = 0;	// USB clock
	reg clk_samp = 0;	// Capture samplerate

	reg  [7:0] in_file_data;
	reg  in_file_valid;
	reg  in_file_done;

	wire usb_dp;
	wire usb_dn;
	wire uart_tx;

	integer fh_in, fh_out, rv;

	// Setup recording
	initial begin
		$dumpfile("iua_top_tb.vcd");
		$dumpvars(0,iua_top_tb);
	end

	// Reset pulse
	initial begin
		# 200 rst = 0;
		# 50000000 $finish;
	end

	// Clocks
	always #10.416 clk_48m  = !clk_48m;
	always #3.247  clk_samp = !clk_samp;

	// DUT
	iua_top dut_I (
		.usb_dp_pad(usb_dp),
		.usb_dn_pad(usb_dn),
		.uart_tx(uart_tx),
		.uart_rx(1'b1),
		.clk(clk_48m),
		.rst(rst)
	);

	// Read file
	initial
		fh_in = $fopen("../data/capture_usb_raw.bin", "rb");

	always @(posedge clk_samp)
	begin
		if (rst) begin
			in_file_data  <= 8'h00;
			in_file_valid <= 1'b0;
			in_file_done  <= 1'b0;
		end else begin
			if (!in_file_done) begin
				rv = $fread(in_file_data, fh_in);
				in_file_valid <= (rv == 1);
				in_file_done  <= (rv != 1);
			end else begin
				in_file_data  <= 8'h00;
				in_file_valid <= 1'b0;
				in_file_done  <= 1'b1;
			end
		end
	end

	// Input
	assign usb_dp = in_file_data[1] & in_file_valid;
	assign usb_dn = in_file_data[0] & in_file_valid;

	// Save the resulting byte stream
	initial
		fh_out = $fopen("../data/capture_usb_simout.hex", "wb");

	always @(posedge clk_48m)
	begin
		if (dut_I.uart_ack)
			$fwrite(fh_out, "%h", dut_I.uart_data);
	end

endmodule // iua_top_tb

