// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1 ns/1 ns  // time-unit, precision

`default_nettype none
module Debouncer_tb();

	parameter CLOCK_HZ       = 10_000_000;
	parameter HALF_PERIOD_NS = 1_000_000_000 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Delay task
	task Delay_us(input integer DelayTime_us);
		repeat((CLOCK_HZ / 1_000_000) * DelayTime_us)
			@(posedge Clock);
	endtask
	
	// Variable dump
	initial begin
		$dumpfile("debouncer.vcd");
		$dumpvars(0, Debouncer_tb);
	end
	
	// Variables
	reg Reset  = 1'b0;
	reg Button = 1'b0;
	
	// Test sequence
	integer i;
	initial begin
		$timeformat(-6, 3, "us", 10);
		$display("===== START =====");
		$display("CLOCK_HZ  = %9d", DUT.CLOCK_HZ);
		$display("PERIOD_US = %9d", DUT.PERIOD_US);
		$display("DELAY     = %9d", DUT.DELAY);
		$display("WIDTH     = %9d", DUT.WIDTH);

		@(posedge Clock)
		Reset = 1'b1;
		
		// Toggle state of Button signal and wait longer tine in each loop
		for(i=1; i<=20; i=i+1) begin
			Delay_us(i);
			Button <= ~Button;
		end
		
		@(posedge Clock)
		$display("====== END ======");
		$finish;
	end

	// Instantiate device under test
	Debouncer #(
		.CLOCK_HZ(CLOCK_HZ),
		.PERIOD_US(10)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.NoisySignal_i(Button),
		.FilteredSignal_o()
	);

endmodule
`default_nettype wire
