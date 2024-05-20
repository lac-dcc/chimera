// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   02:09:58 08/08/2023
// Design Name:   FullAdder
// Module Name:   /home/ise/HDL/combinational-logic/TestFullAdder.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FullAdder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestFullAdder;

	// Inputs
	reg a;
	reg b;
	reg carry_in;

	// Outputs
	wire carry_out;
	wire out;

	// Instantiate the Unit Under Test (UUT)
	hFullAdder uut (
		.a(a), 
		.b(b), 
		.carry_in(carry_in), 
		.carry_out(carry_out), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		carry_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 0;
		b = 0;
		carry_in = 1;
		
		#100;
		
		a = 0;
		b = 1;
		carry_in = 0;
		
		#100;
		
		a = 0;
		b = 1;
		carry_in = 1;
		
		#100;
		
		a = 1;
		b = 0;
		carry_in = 0;
		
		#100;
		
		a = 1;
		b = 0;
		carry_in = 1;
		
		#100;
		
		a = 1;
		b = 1;
		carry_in = 0;
		
		#100;
		
		a = 1;
		b = 1;
		carry_in = 1;
		
		#100;
	end
      
endmodule

