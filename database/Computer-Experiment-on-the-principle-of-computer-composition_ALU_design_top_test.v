`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:06:08 06/09/2018
// Design Name:   ALU_TOP
// Module Name:   D:/FPGA/ALU_design/top_test.v
// Project Name:  ALU_design
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_TOP
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_test;

	// Inputs
	reg [2:0] AB_SW;
	reg [2:0] ALU_OP;
	reg [2:0] F_LED_SW;

	// Outputs
	wire [7:0] LED;

	// Instantiate the Unit Under Test (UUT)
	ALU_TOP uut (
		.AB_SW(AB_SW), 
		.ALU_OP(ALU_OP), 
		.F_LED_SW(F_LED_SW), 
		.LED(LED)
	);

	initial begin
		// Initialize Inputs
		AB_SW = 0;
		ALU_OP = 0;
		F_LED_SW = 0;

		// Wait 100 ns for global reset to finish
		#100;
      AB_SW = 000;ALU_OP = 000;F_LED_SW = 000; 
		#100;
      AB_SW = 001;ALU_OP = 001;F_LED_SW = 001; 
		#100;
      AB_SW = 010;ALU_OP = 010;F_LED_SW = 010; 
		#100;
      AB_SW = 011;ALU_OP = 011;F_LED_SW = 011; 
		#100;
      AB_SW = 100;ALU_OP = 100;F_LED_SW = 100; 
		#100;
      AB_SW = 101;ALU_OP = 101;F_LED_SW = 101; 
		#100;
      AB_SW = 110;ALU_OP = 110;F_LED_SW = 110; 
		#100;
      AB_SW = 111;ALU_OP = 111;F_LED_SW = 111; 
		// Add stimulus here
		


	end
      
endmodule

