// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

`include "segdisplay.v"

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:13:44 09/07/2023
// Design Name:   segdisplay
// Module Name:   /home/ise/HDL/computer/TestSegdisplay.v
// Project Name:  hack_computer
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: segdisplay
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TestSegdisplay;
	localparam T = 10;

	// Inputs
	reg clock;
	reg reset;

	// Outputs
	wire [7:0] sel;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	segdisplay uut (
		.clock(clock), 
		.reset(reset), 
		.sel(sel), 
		.data(data)
	);
	
	always begin
		clock = 1'b0;
		#(T/2);
		
		clock = 1'b1;
		#(T/2);
	end

	initial begin
		reset = 1;
		
		#40;
		
		reset = 0;
		
		#1000;
	end
      
endmodule

