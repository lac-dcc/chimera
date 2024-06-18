// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:03:36 08/04/2023
// Design Name:   hMux4Way16
// Module Name:   /home/ise/HDL/base/TesthMux4Way16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: hMux4Way16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TesthMux4Way16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;
	reg [15:0] c;
	reg [15:0] d;
	reg [1:0] sel;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	hMux4Way16 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.sel(sel), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		d = 0;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 16'b01;
		c = 16'b10;
		d = 16'b11;
		sel = 2'b00;
		
		#100;

		sel = 2'b01;
		
		#100;
		
		sel = 2'b10;
		
		#100;
		
		sel = 2'b11;
		
		#100;
	end
      
endmodule

