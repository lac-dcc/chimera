// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:39:56 08/04/2023
// Design Name:   hDMux4Way
// Module Name:   /home/ise/HDL/base/TesthDMux4Way.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hDMux4Way
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthDMux4Way;

	// Inputs
	reg in;
	reg [1:0] sel;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;

	// Instantiate the Unit Under Test (UUT)
	hDMux4Way uut (
		.in(in), 
		.sel(sel), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d)
	);

	initial begin
		// Initialize Inputs
		in = 1;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 2'b01;
		
		#100;
		
		sel = 2'b10;
		
		#100;
		
		sel = 2'b11;
		
		#100;
	end
      
endmodule

