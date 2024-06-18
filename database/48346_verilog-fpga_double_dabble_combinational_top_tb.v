// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231224

`timescale 1ns/1ns

`default_nettype none
module top_tb();
	
	parameter CLOCK_HZ            = 1_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset = 0;
	reg AsyncA = 1;
	reg AsyncB = 1;
	integer i;
	
	// Variable dump
	initial begin
		$dumpfile("top.vcd");
		$dumpvars(0, top_tb);
	end
	
	// Instantiate device under test
	top #(
		.CLOCK_HZ(CLOCK_HZ)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.EncoderA_i(AsyncA),
		.EncoderB_i(AsyncB),
		.Cathodes_o(),
		.Segments_o()
	);
	
	// Test sequence
	initial begin
		$timeformat(-9, 3, "ns", 10);
		$display("===== START =====");
		
		@(posedge Clock);
		Reset = 1'b1;
		
		// 10 increment events
		for(i=0; i<10; i=i+1) begin
			#10000 AsyncA = 1'b0;
			#10000 AsyncB = 1'b0;
			#10000 AsyncA = 1'b1;
			#10000 AsyncB = 1'b1;
			#20000;
		end
		
		// 20 decrement events
		for(i=0; i<20; i=i+1) begin
			#10000 AsyncB = 1'b0;
			#10000 AsyncA = 1'b0;
			#10000 AsyncB = 1'b1;
			#10000 AsyncA = 1'b1;
			#20000;
		end
		
		@(posedge Clock);
		
		$display("====== END ======");
		$finish;
	end

endmodule
