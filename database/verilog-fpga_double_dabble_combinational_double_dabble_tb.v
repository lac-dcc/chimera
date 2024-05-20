// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

// 231124

`timescale 1ns/1ns

`default_nettype none
module DoubleDabble_tb();
	
	// Configuration
	parameter INPUT_BITS    = 8;
	parameter OUTPUT_DIGITS = 3;
	parameter OUTPUT_BITS   = OUTPUT_DIGITS * 4;
	
	parameter CLOCK_HZ            = 1_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS;
		Clock = !Clock;
	end
	
	// Variables
	reg  [ INPUT_BITS-1:0] Binary = 0;
	wire [OUTPUT_BITS-1:0] BCD;
	integer MaxInput = 2**INPUT_BITS - 1;
	integer i;
	
	// Variable dump
	initial begin
		$dumpfile("double_dabble.vcd");
		$dumpvars(0, DoubleDabble_tb);
	end
	
	// Instantiate device under test
	DoubleDabble #(
		.INPUT_BITS(INPUT_BITS),
		.OUTPUT_DIGITS(OUTPUT_DIGITS)
	) DUT(
		.Binary_i(Binary),
		.BCD_o(BCD)
	);
	
	// Verification
	integer PassCounter = 0;
	integer FailCounter = 0;
	integer Result;
	integer Digit;
	
	task Verify(input [INPUT_BITS-1:0] Binary, input [OUTPUT_BITS-1:0] BCD);
		begin
			// Initialize temporary variable
			Result = 0;
			
			// Convert BCD to binary
			for(Digit=0; Digit<OUTPUT_DIGITS; Digit=Digit+1) begin
				Result = Result + BCD[Digit*4+:4] * 10**Digit;
			end
			
			if(Result === Binary)
				PassCounter = PassCounter + 1;
			else
				FailCounter = FailCounter + 1;
		end
	endtask
	
	// Test sequence
	initial begin
		$timeformat(-9, 3, "ns", 10);
		$display("===== START =====");
		$display("INPUT_BITS:    %9d", INPUT_BITS);
		$display("OUTPUT_BITS:   %9d", DUT.OUTPUT_BITS);
		$display("OUTPUT_DIGITS: %9d", OUTPUT_DIGITS);
		$display("MaxInput:      %9d", MaxInput);
		
		// Test from zero to maximum value
		for(i=0; i<=MaxInput; i=i+1) begin
			@(posedge Clock);
			Binary <= i;
			Verify(Binary, BCD);
		end
		
		// Test from maximum value to zero
		for(i=MaxInput; i>=0; i=i-1) begin
			@(posedge Clock);
			Binary <= i;
			Verify(Binary, BCD);
		end
		
		@(posedge Clock);
		
		// Display verification results
		$display("Pass: %d", PassCounter);
		$display("Fail: %d", FailCounter);
		$display("====== END ======");
		$finish;
	end

endmodule
