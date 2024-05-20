// This program was cloned from: https://github.com/leonow32/verilog-fpga
// License: MIT License

`timescale 1ns/1ns  // time-unit, precision

`default_nettype none
module ROM_tb();

	parameter      CLOCK_HZ       = 10_000_000;
	parameter real HALF_PERIOD_NS = 1_000_000_000.0 / (2 * CLOCK_HZ);
	
	// Clock generator
	reg Clock = 1'b1;
	always begin
		#HALF_PERIOD_NS Clock = !Clock;
	end
	
	// Variables
	reg        Reset      = 1'b0;
	reg        ReadEnable = 1'b0;
	reg  [3:0] Address;
	wire [7:0] Data;
	
	// Instantiate device under test
	ROM #(
		.ADDRESS_WIDTH(4),
		.DATA_WIDTH(8),
		.MEMORY_DEPTH(16),
		.MEMORY_FILE("data.mem")
	) DUT(
		.Clock(Clock),
		.Reset(Reset),
		.ReadEnable_i(ReadEnable),
		.Address_i(Address),
		.Data_o(Data)
	);
	
	// Variable dump
	initial begin
		$dumpfile("rom.vcd");
		$dumpvars(0, ROM_tb);
	end

	// Test sequence
	integer i;
	initial begin
		$timeformat(-6, 3, "us", 12);
		$display("===== START =====");
		$display("MEMORY_DEPTH: %0d", DUT.MEMORY_DEPTH);
		
		// Print all the memory contents
		for(i=0; i<DUT.MEMORY_DEPTH; i=i+1) begin
			$display("Memory[%d] = %h", i, DUT.Memory[i]);
		end
		
		@(posedge Clock);
		Reset <= 1'b1;
		
		// Pause
		@(posedge Clock);
		
		// Read the data
		ReadEnable <= 1'b1;
		for(i=0; i<DUT.MEMORY_DEPTH; i=i+1) begin
			Address <= i;
			@(posedge Clock);
		end
		
		ReadEnable <= 1'b0;
		
		// Pause
		repeat(2) @(posedge Clock);
		
		$display("===== END =====");
		$finish;
	end

endmodule
`default_nettype wire