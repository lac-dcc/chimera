// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module SoundGenerator_tb();

	parameter CLOCK_HZ	= 2_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg Reset  = 1'b0;
	reg Start  = 1'b0;
	reg Finish = 1'b0;
	reg [15:0] Duration_ms   = 16'd0;
	reg [15:0] HalfPeriod_us = 16'd0;
	wire Done;
	wire Busy;
	wire SoundWave;
	
	// Instantiate device under test
	SoundGenerator #(
		.CLOCK_HZ(CLOCK_HZ)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(Start),
		.Finish_i(Finish),
		.Duration_ms_i(Duration_ms),
		.HalfPeriod_us_i(HalfPeriod_us),
		
		.SoundWave_o(SoundWave),
		.Busy_o(Busy),
		.Done_o(Done)
	);
	
	// Variable dump
	initial begin
		$dumpfile("sound_generator.vcd");
		$dumpvars(0, SoundGenerator_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("        Time Durat HaPer        Freq");

		#1 Reset <= 1'b1; 
		
		repeat(10) @(posedge Clock);
		
		// 1ms, 50kHz
		Duration_ms   <= 16'd1;
		HalfPeriod_us <= 16'd9;
		Start         <= 1'b1;
		@(posedge Clock);
		Duration_ms   <= 16'dX;
		HalfPeriod_us <= 16'dX;
		Start         <= 1'b0;
		@(posedge Done);
		
		// 2ms, silence
		Duration_ms   <= 16'd2;
		HalfPeriod_us <= 16'd0;
		Start         <= 1'b1;
		@(posedge Clock);
		Duration_ms	  <= 16'dX;
		HalfPeriod_us <= 16'dX;
		Start         <= 1'b0;
		@(posedge Done);
		
		// 3ms, 10kHz
		Duration_ms   <= 16'd3;
		HalfPeriod_us <= 16'd49;
		Start         <= 1'b1;
		@(posedge Clock);
		Duration_ms   <= 16'dX;
		HalfPeriod_us <= 16'dX;
		Start         <= 1'b0;
		@(posedge Done);
		
		// 0ms, 5kHz
		Duration_ms   <= 16'd0;
		HalfPeriod_us <= 16'd99;
		Start         <= 1'b1;
		@(posedge Clock);
		Duration_ms   <= 16'dX;
		HalfPeriod_us <= 16'dX;
		Start         <= 1'b0;
		repeat(5) @(posedge Clock);
		
		// 10ms, 100Hz
		Duration_ms	  <= 16'd10;
		HalfPeriod_us <= 16'd499;
		Start         <= 1'b1;
		@(posedge Clock);
		Duration_ms	  <= 16'dX;
		HalfPeriod_us <= 16'dX;
		Start         <= 1'b0;
		repeat(12500) @(posedge Clock);
		
		// Break operation
		Finish        <= 1'b1;
		@(posedge Clock);
		Finish        <= 1'b0;
		repeat(500) @(posedge Clock);
		
		#1 $display("====== END ======");
		#1 $finish;
	end

endmodule
`default_nettype wire
