// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module VGA_tb();

//	parameter CLOCK_HZ	= 25_175_000;
//	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2.0 * CLOCK_HZ);
	
//	parameter CLOCK_HZ	= 25_175_000;
//	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	parameter CLOCK_HZ	= 25_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset  = 1'b1;
	
	// Instantiate device under test
	VGA #(
		.CLOCK_HZ(CLOCK_HZ)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		
		.HSync_o(),
		.VSync_o(),
		.Red_o(),
		.Green_o(),
		.Blue_o()
	);

	// Variable dump
	initial begin
		$dumpfile("vga.vcd");
		$dumpvars(0, VGA_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");

		@(posedge Clock);
		Reset = 1'b0;
		#1 Reset = 1'b1;
		
		repeat(1000) @(posedge Clock);
			
		wait(DUT.VCounter_r == 0);
		repeat(1000) @(posedge Clock);
		
		#1 $display("===== END =====");
		#1 $finish;
	end
	
endmodule
`default_nettype wire
