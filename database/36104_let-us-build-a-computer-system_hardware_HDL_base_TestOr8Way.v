// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:11:01 08/07/2023
// Design Name:   Or8Way
// Module Name:   /home/ise/HDL/base/TestOr8Way.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Or8Way
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestOr8Way;

	// Inputs
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	Or8Way uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		in = 8'b00000001;
		
		#100;
		
		in = 8'b11110000;
		
		#100;
		
		in = 8'b11111111;
		
		#100;
	end
      
endmodule

