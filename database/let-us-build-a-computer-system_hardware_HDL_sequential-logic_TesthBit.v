// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:10:28 08/14/2023
// Design Name:   hBit
// Module Name:   /home/ise/HDL/sequential-logic/TesthBit.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hBit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthBit;
	localparam T = 20; // clock period

	// Inputs
	reg in;
	reg load;
	reg clock;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	hBit uut (
		.in(in), 
		.load(load), 
		.clock(clock), 
		.out(out)
	);
	
	always begin
		clock = 1'b1;
		#(T/2);
		
		clock = 1'b0;
		#(T/2);
	end

	initial begin
		// case 1
		in = 0;
		load = 0;
		
		@(negedge clock);
		if (out != 0) begin
			$display("Test Case 1 Failure.");
			$finish;
		end
		
		// Case 2
		in = 1;
		load = 0;
		
		@(negedge clock);
		if (out != 0) begin
			$display("Test Case 2 Failure.");
			$finish;
		end
      
		// Case 3
		in = 1;
		load = 1;
		
		@(negedge clock);
		if (out != 1) begin
			$display("Test Case 3 Failure.");
			$finish;
		end
	
		// Case 4
		in = 0;
		load = 1;
		
		@(negedge clock);
		if (out != 0) begin
			$display("Test Case 4 Failure.");
			$finish;
		end
		
		// Add stimulus here

	end
      
endmodule

