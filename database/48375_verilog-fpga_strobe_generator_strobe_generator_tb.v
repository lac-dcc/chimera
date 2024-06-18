// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230428

`timescale 1ns/1ps	// time-unit, precision

module StrobeGenerator_tb();
	
	parameter CLOCK_HZ	= 10_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	reg	Reset = 1'b0;
	reg EnableSync = 1'b1;
	reg EnableAsync = 1'b1;
	wire Strobe;
	
	always @(posedge Clock) begin
		EnableSync <= EnableAsync;
	end
	
	// Instantiate device under test
	StrobeGenerator #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(2)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(EnableSync),
		.Strobe_o(Strobe)
	);
	
	// Variable dump
	initial begin
		$dumpfile("strobe_generator.vcd");
		$dumpvars(0, StrobeGenerator_tb);
	end

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("CLOCK_HZ  = %9d", DUT.CLOCK_HZ);
		$display("PERIOD_US = %9d", DUT.PERIOD_US);
		$display("DELAY     = %9d", DUT.DELAY);
		$display("WIDTH     = %9d", DUT.WIDTH);
		
		#1 Reset = 1'b1;
		
		repeat(2) begin
			@(posedge Strobe);
			$display("Strobe detected at %t", $realtime);
		end
		
		@(negedge Strobe);
		#1000;
		
		EnableAsync = 1'b0;
		#1000;
		EnableAsync = 1'b1;
		
		repeat(2) begin
			@(posedge Strobe);
			$display("Strobe detected at %t", $realtime);
		end
		
		#512;
		EnableAsync = 1'b0;
		#525;
		EnableAsync = 1'b1;
		
		repeat(2) begin
			@(posedge Strobe);
			$display("Strobe detected at %t", $realtime);
		end
		
		$display("===== END =====");
		#1 $finish;
	end

endmodule
