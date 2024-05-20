// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hXOr.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:05:56 08/01/2023
// Design Name:   hXor
// Module Name:   /home/ise/HDL/base/TesthXor.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//l
// Verilog Test Fixture created by ISE for module: hXor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthXor;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	hXOr uut (
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
		a = 0;
		b = 1;
		
		#100
		
		a = 1;
		b = 0;
		
		#100;
		
		a = 1;
		b = 1;
		
		#100;
	end
      
endmodule

