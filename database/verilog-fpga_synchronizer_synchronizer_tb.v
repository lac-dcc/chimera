// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns  // time-unit, precision
`default_nettype none

module Synchronizer_tb();

  parameter CLOCK_HZ  = 10_000_000;
  parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2.0 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
  
	// Variables
	reg        Reset;
	reg  [3:0] AsynchInput = 4'b0000;
	wire [3:0] SyncOutput;
	
	// Instantiate device under test
	Synchronizer #(
		.WIDTH(4)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Async_i(AsynchInput),
		.Sync_o(SyncOutput)
	);
	
	// Variable dump
	initial begin
		$dumpfile("synchronizer.vcd");
		$dumpvars(0, Synchronizer_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("      Time Reset AsynchInput SyncOutput");
		$monitor("%t     %d        %b       %b", $realtime, Reset, AsynchInput, SyncOutput);

		#5 Reset = 1'b0; 
		#5 Reset = 1'b1;

		@(posedge Clock);
		#75  AsynchInput = 4'b0001;
		#353 AsynchInput = 4'b0000;
		#500

		@(posedge Clock);
		#110 AsynchInput = 4'b0011;
		#456 AsynchInput = 4'b0000;
		#500;

		$display("====== END ======");
		$finish;
	end

endmodule
`default_nettype wire
