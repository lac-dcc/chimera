// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:09:55 08/07/2023
// Design Name:   HalfAdder
// Module Name:   /home/ise/HDL/combinational-logic/TestHalfAdder.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HalfAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestHalfAdder;

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire carry;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	hHalfAdder uut (
		.a(a), 
		.b(b), 
		.carry(carry), 
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
		
		#100;
		
		a = 1;
		b = 0;
		
		#100;
		
		a = 1;
		b = 1;
		
		#100;
	end
      
endmodule

