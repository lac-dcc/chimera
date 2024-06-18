// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hXOr16.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:21:23 08/03/2023
// Design Name:   hXOr16
// Module Name:   /home/ise/HDL/base/TesthXOr16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hXOr16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthXOr16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hXOr16 uut (
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
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		
		#100;
		
		a = 16'b1010101010101010;
		b = 16'b0101010101010101;
		
		#100;
	end
      
endmodule

