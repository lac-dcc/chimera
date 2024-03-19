`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:24:39 06/09/2018
// Design Name:   TOP_RIJ_CPU
// Module Name:   D:/FPGA/R_I_J_instruction/test.v
// Project Name:  R_I_J_instruction
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_RIJ_CPU
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
	reg rst;
	reg clk_100MHz;
	reg clk;

	// Outputs
	wire ZF;
	wire OF;
	wire [31:0] F;
	wire [31:0] M_R_Data;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	TOP_RIJ_CPU uut (
		.rst(rst), 
		.clk_100MHz(clk_100MHz), 
		.clk(clk), 
		.ZF(ZF), 
		.OF(OF), 
		.F(F), 
		.M_R_Data(M_R_Data), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk_100MHz = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever
		begin
		#2;
		clk=~clk;
		#10;
		clk_100MHz=~clk_100MHz;
		
		end

	end
      
endmodule

