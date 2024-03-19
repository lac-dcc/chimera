`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:41:28 06/16/2018
// Design Name:   pc
// Module Name:   D:/FPGA/PC/test.v
// Project Name:  PC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: pc
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
	reg clk;
	reg rst;

	// Outputs
	wire [31:0] Inst_code;

	// Instantiate the Unit Under Test (UUT)
	pc uut (
		.clk(clk), 
		.rst(rst), 
		.Inst_code(Inst_code)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1;
		rst = 0;
		
		#100;
		clk = 0;
		rst = 0;
		
		#100;
		clk = 1;
		rst = 0;
		
		#100;
		clk = 0;
		rst = 0;
		
		#100;
		clk = 1;
		rst = 0;
		
		#100;
		clk = 0;
		rst = 0;
		
		#100;
		clk = 1;
		rst = 0;
		
		#100;
		clk = 0;
		rst = 0;
		
		// Add stimulus here

	end
      
endmodule

