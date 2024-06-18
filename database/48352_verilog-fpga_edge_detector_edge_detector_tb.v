// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230425

`timescale 1ns/1ns
`default_nettype none

module EdgeDetector_tb();
	
	parameter CLOCK_HZ	= 100_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variable dump
	initial begin
		$dumpfile("edge_detector.vcd");
		$dumpvars(0, EdgeDetector_tb);
	end
	
	// Test variables
	reg Reset = 1'b0;
	reg Signal = 1'b0;
	
	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");

		@(posedge Clock) 
		Reset <= 1'b1;
		
		repeat(5) @(posedge Clock);
		Signal <= 1'b1;
		repeat(10) @(posedge Clock);
		Signal <= 1'b0;
		
		repeat(10) @(posedge Clock);
		Signal <= 1'b1;
		repeat(5) @(posedge Clock);
		Signal <= 1'b0;
		
		repeat(10) @(posedge Clock);
		Signal <= 1'b1;
		@(posedge Clock);
		Signal <= 1'b0;
		
		repeat(5) @(posedge Clock);
		#1 $display("====== END ======");
		#1 $finish;
	end
	
	// Instantiate device under test
	EdgeDetector DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Signal_i(Signal),
		.RisingEdge_o(),
		.FallingEdge_o()
	);

endmodule
`default_nettype wire
