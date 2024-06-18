// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps
`include "hMux16.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:23:21 08/03/2023
// Design Name:   hMux16
// Module Name:   /home/ise/HDL/base/TesthMux16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hMux16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthMux16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg sel;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hMux16 uut (
		.a(a), 
		.b(b), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 0;
		sel = 1;
		
		#100;
		
		a = 0;
		b = 1;
		sel = 0;

		#100;
		
		a = 0;
		b = 1;
		sel = 1;
		
		#100;
	end
      
endmodule

