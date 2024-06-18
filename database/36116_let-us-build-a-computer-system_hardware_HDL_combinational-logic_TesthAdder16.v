// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:04:06 08/08/2023
// Design Name:   Adder16
// Module Name:   /home/ise/HDL/combinational-logic/TestAdder16.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestAdder16;

	// Inputs
	reg [15:0] a;
	reg [15:0] b;

	// Outputs
	wire [15:0] out;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	hAdder16 uut (
		.a(a), 
		.b(b), 
		.out(out), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a = 16'b0000111100001111;
		b = 16'b1111000011110000;
		
		#100;
		
		a = 16'b1111111111111111;
		b = 16'b1111111111111111;
		
		#100;
		
		a = 16'b1111111111111111;
		b = 16'b1;
		
		#100;
	end
      
endmodule

