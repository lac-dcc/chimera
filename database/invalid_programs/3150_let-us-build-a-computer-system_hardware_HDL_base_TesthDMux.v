// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hDMux.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:07:05 08/02/2023
// Design Name:   hDMux
// Module Name:   /home/ise/HDL/base/TesthDMux.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hDMux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthDMux;

	// Inputs
	reg in;
	reg sel;

	// Outputs
	wire a;
	wire b;

	// Instantiate the Unit Under Test (UUT)
	hDMux uut (
		.in(in), 
		.sel(sel), 
		.a(a), 
		.b(b)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 0;
		sel = 1;
		
		#100;
		
		in = 1;
		sel = 0;
		
		#100;
		
		in = 1;
		sel = 1;
		
		#100;
	end
      
endmodule

