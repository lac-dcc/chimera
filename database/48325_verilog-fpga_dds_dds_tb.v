// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 240218

`timescale 1ns/1ps

`default_nettype none
module DDS_tb();
	
	// Configuration
	parameter CLOCK_HZ   = 25_000_000;
	reg [7:0] TuningWord = 100;
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#(1_000_000_000.0 / (2 * CLOCK_HZ));
		Clock = !Clock;
	end
	
	// Variables
	reg Reset = 0;
	
	// Variable dump
	initial begin
		$dumpfile("dds.vcd");
		$dumpvars(0, DDS_tb);
	end
	
	// Instantiate device under test
	DDS DUT(
		.Clock(Clock),
		.Reset(Reset),
		.TuningWord_i(TuningWord),
		.Amplitude_i(8'hFF),
		.Signal_o(),
		.Overflow_o()
	);
	
	// Measure signal frequency
	always @(posedge DUT.Overflow_o) begin: MeasureFreq
		real TimePrevious;
		real Freq;
		
		if(TimePrevious == 0) begin
			TimePrevious = $realtime;
		end else begin
			Freq = 1_000_000_000.0 / ($realtime - TimePrevious);
			$display("%t %10.3f Hz", $realtime, Freq);
			TimePrevious = $realtime;
		end
	end
	
	// Test sequence
	initial begin
		$timeformat(-3, 3, "ms", 10);
		$display("===== START =====");
		
		@(posedge Clock);
		Reset <= 1'b1;
		
		repeat(10) @(posedge DUT.Overflow_o);
		
		$display("====== END ======");
		$finish;
	end

endmodule
