// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hNot16.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:19:26 08/02/2023
// Design Name:   hNot16
// Module Name:   /home/ise/HDL/base/TesthNot16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hNot16l
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthNot16;

	// Inputs
	reg [15:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hNot16 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 16'b1;
		#100;
		
		in = 16'b10;
		#100;
		
		in = 16'b100;
		#100;
		
		in = 16'b1000;
		#100;
		
		in = 16'b10000;
		#100;
		
		in = 16'b100000;
		#100;
		
		in = 16'b1000000;
		#100;
		
		in = 16'b10000000;
		#100;
		
		in = 16'b100000000;
		#100;
		
		in = 16'b1000000000;
		#100;
		
		in = 16'b10000000000;
		#100;
		
		in = 16'b100000000000;
		#100;
		
		in = 16'b1000000000000;
		#100;
		
		in = 16'b10000000000000;
		#100;
		
		in = 16'b100000000000000;
		#100;
		
		in = 16'b1000000000000000;
		#100;
	end
      
endmodule

