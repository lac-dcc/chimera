// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 230809

`timescale 1ns/1ps	// time-unit, precision

module StrobeGenerator_tb();
	
	parameter CLOCK_HZ	= 10_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	reg	Reset = 1'b0;
	reg Enable = 1'b0;
	wire Strobe;
	
	// Variable dump
	initial begin
		$dumpfile("strobe_generator.vcd");
		$dumpvars(0, StrobeGenerator_tb);
	end
	
	// Instantiate device under test
	StrobeGeneratorTicks #(
		.TICKS(10)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Enable_i(Enable),
		.Strobe_o(Strobe)
	);

	// Test sequence
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("TICKS    = %9d", DUT.TICKS);
		$display("MAXCOUNT = %9d", DUT.MAXCOUNT);
		$display("WIDTH    = %9d", DUT.WIDTH);
		
		@(posedge Clock);
		Reset <= 1'b1;
		
		@(posedge Clock);
		Enable <= 1'b1;
		
		repeat(4) begin
			@(posedge Strobe);
			$display("Strobe detected at %t", $realtime);
		end
		
		$display("===== END =====");
		$finish;
	end

endmodule
