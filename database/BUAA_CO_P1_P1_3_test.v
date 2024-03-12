`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:01:11 10/25/2018
// Design Name:   ext
// Module Name:   E:/Verilog/P1_3/test.v
// Project Name:  P1_3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ext
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test;

	// Inputs
	reg [15:0] imm;
	reg [1:0] EOp;

	// Outputs
	wire [31:0] ext;

	// Instantiate the Unit Under Test (UUT)
	ext uut (
		.imm(imm), 
		.EOp(EOp), 
		.ext(ext)
	);

	initial begin
		// Initialize Inputs
		imm = 16'b1100110010101010;
		EOp = 2'b00;

		// Wait 100 ns for global reset to finish
		#10;
		EOp = 2'b01;
		#10;
		EOp = 2'b10;
		#10;
		EOp = 2'b11;
		// Add stimulus here

	end
      
endmodule

