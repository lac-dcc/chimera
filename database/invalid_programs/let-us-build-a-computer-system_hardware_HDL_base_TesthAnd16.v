// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hAnd16.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:22:13 08/03/2023
// Design Name:   hAnd16
// Module Name:   /home/ise/HDL/base/TesthAnd16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hAnd16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthAnd16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hAnd16 uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 16'b0000000000000001;
		b = 16'b0000000000000001;
		
		#100;
		
		a = 16'b0000000011111111;
		b = 16'b1111111100000000;
		
		#100;
		
		a = 16'b0000111100001111;
		b = 16'b0000000011111111;
		
		#100;
		
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		
		#100;
	end
      
endmodule

