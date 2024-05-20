// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:10:43 08/04/2023
// Design Name:   hDMux8Way
// Module Name:   /home/ise/HDL/base/TesthDMux8Way.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hDMux8Way
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthDMux8Way;

	// Inputs
	reg in;
	reg [2:0] sel;

	// Outputs
	wire a;
	wire b;
	wire c;
	wire d;
	wire e;
	wire f;
	wire g;
	wire h;

	// Instantiate the Unit Under Test (UUT)
	hDMux8Way uut (
		.in(in), 
		.sel(sel), 
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.e(e), 
		.f(f), 
		.g(g), 
		.h(h)
	);

	initial begin
		// Initialize Inputs
		in = 1;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel = 3'b001;
		
		#100;
		
		sel = 3'b010;
		
		#100;
		
		sel = 3'b011;
		
		#100;
		
		sel = 3'b100;
		
		#100;
		
		sel = 3'b101;
		
		#100;
		
		sel = 3'b110;
		
		#100;
		
		sel = 3'b111;
	end
      
endmodule

