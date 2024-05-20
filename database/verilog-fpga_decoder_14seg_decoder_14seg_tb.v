// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231104

`timescale 1ns/1ns

`default_nettype none
module Decoder14seg_tb();
	
	parameter CLOCK_HZ       = 1_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset  = 1'b0;
	reg Enable = 1'b0;
	reg [7:0] Data;
	integer i;
	
	// Variable dump
	initial begin
		$dumpfile("decoder_14seg.vcd");
		$dumpvars(0, Decoder14seg_tb);
	end
	
	// Test sequence
	initial begin
		$timeformat(-9, 3, "ns", 10);
		$display("===== START =====");
		
		@(posedge Clock);
		Reset = 1'b1;
		
		@(posedge Clock);
		Enable = 1'b1;
		
		for(i=0; i<=8'h5F; i=i+1) begin
			@(posedge Clock);
			Data <= i;
		end
		
		@(posedge Clock);
		Enable = 1'b0;
		
		$display("====== END ======");
		$finish;
	end
	
	// Instantiate device under test
	Decoder14seg DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(Enable),
		.Data_i(Data),
		.Segments_o()
	);

endmodule
