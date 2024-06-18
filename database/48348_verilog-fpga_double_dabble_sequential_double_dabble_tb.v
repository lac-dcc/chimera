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
	reg Reset = 0;
	reg Start = 0;
	wire Done;
	reg  [ INPUT_BITS-1:0] Binary = {INPUT_BITS{1'bX}};
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
		.OUTPUT_DIGITS(OUTPUT_DIGITS),
		.OUTPUT_BITS(OUTPUT_BITS)
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.Start_i(Start),
		.Busy_o(),
		.Done_o(Done),
		.Binary_i(Binary),
		.BCD_o(BCD)
	);
	
	// Verification
	integer PassCounter = 0;
	integer FailCounter = 0;
	
	task Verify(input [INPUT_BITS-1:0] Binary, input [OUTPUT_BITS-1:0] BCD);
		integer Digit;
		
		begin: VerifyBlock
			reg [OUTPUT_BITS-1:0] Result;
			Result = 0;
			
			// Convert BCD to binary
			for(Digit=0; Digit<OUTPUT_DIGITS; Digit=Digit+1) begin
				Result = Result + BCD[Digit*4+:4] * 10**Digit;
			end
			
			if(Result === Binary)
				PassCounter = PassCounter + 1;
			else begin
				FailCounter = FailCounter + 1;
				$fatal(0, "Result: %h, Binary %h, BCD: %h", Result, Binary, BCD);
			end
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
		$display("Counter WIDTH: %9d", DUT.WIDTH);
		
		@(posedge Clock);
		Reset = 1'b1;
		
		// Test from zero to maximum value
		for(i=0; i<=MaxInput; i=i+1) begin
			@(posedge Clock);
			Binary <= i;
			Start  <= 1'b1;
			
			@(posedge Clock);
			Binary <= {INPUT_BITS{1'bX}};
			Start  <= 1'b0;
			
			@(posedge Done);
			Verify(i, BCD);
		end
		
		// Test from maximum value to zero
		for(i=MaxInput; i>=0; i=i-1) begin
			@(posedge Clock);
			Binary <= i;
			Start  <= 1'b1;
			
			@(posedge Clock);
			Binary <= {INPUT_BITS{1'bX}};
			Start  <= 1'b0;
			
			@(posedge Done);
			Verify(i, BCD);
		end
		
		@(posedge Clock);
		
		// Display verification results
		$display("Pass: %d", PassCounter);
		$display("Fail: %d", FailCounter);
		$display("====== END ======");
		$finish;
	end

endmodule
