// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns

`default_nettype none
module Encoder_tb();

	parameter CLOCK_HZ	     = 10_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset 	= 1'b0;
	reg AsyncA	= 1'b1;
	reg AsyncB	= 1'b1;
	reg AsyncS	= 1'b1;
	
	// Instantiate device under test
	Encoder DUT(
		.Clock(Clock),
		.Reset(Reset),
		.AsyncA_i(AsyncA),
		.AsyncB_i(AsyncB),
		.AsyncS_i(AsyncS),
		.Increment_o(),
		.Decrement_o(),
		.ButtonPress_o(),
		.ButtonRelease_o(),
		.ButtonState_o()
	);
	
	// Variable dump
	initial begin
		$dumpfile("encoder.vcd");
		$dumpvars(0, Encoder_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");

		@(posedge Clock);
		Reset = 1'b1;
		
		#2025;
		
		// Press the button twice
		repeat(2) begin
			#1000 AsyncS = 1'b0;
			#1000 AsyncS = 1'b1;
		end
		
		#2000;
		
		// Two turns right (increment)
		repeat(2) begin
			#500 AsyncA = 1'b0;
			#500 AsyncB = 1'b0;
			#500 AsyncA = 1'b1;
			#500 AsyncB = 1'b1;
			#1000;
		end
			
		#2000;
		
		// Two turns left (decrement)
		repeat(2) begin
			#500 AsyncB = 1'b0;
			#500 AsyncA = 1'b0;
			#500 AsyncB = 1'b1;
			#500 AsyncA = 1'b1;
			#1000;
		end
		
		#2000;
		
		// Improper operation - A low/high
		repeat(2) begin
			#500 AsyncA = 1'b0;
			#500 AsyncA = 1'b1;
			#1000;
		end
		
		// Improper operation - B low/high
		repeat(2) begin
			#500 AsyncB = 1'b0;
			#500 AsyncB = 1'b1;
			#1000;
		end
		
		// Improper operation - both A & B low
		repeat(2) begin
			#500 AsyncA = 1'b0; AsyncB = 1'b0;
			#500 AsyncA = 1'b1; AsyncB = 1'b1;
			#1000;
		end
		
		$display("====== END ======");
		$finish;
	end

endmodule
`default_nettype wire
