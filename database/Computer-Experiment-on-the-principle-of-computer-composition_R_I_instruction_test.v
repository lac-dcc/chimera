`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:45:27 06/02/2018
// Design Name:   TOP_RI_CPU
// Module Name:   D:/FPGA/R_I_instruction/test.v
// Project Name:  R_I_instruction
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: TOP_RI_CPU
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
	reg clk_100MHz;
	reg rst;
	reg clk;

	// Outputs
	wire ZF;
	wire OF;
	wire [31:0] F;
	wire [31:0] M_R_Data;

	// Instantiate the Unit Under Test (UUT)
	TOP_RI_CPU uut (
		.clk_100MHz(clk_100MHz), 
		.rst(rst), 
		.clk(clk), 
		.ZF(ZF), 
		.OF(OF), 
		.F(F), 
		.M_R_Data(M_R_Data)
	);

		initial begin
		// Initialize Inputs
		clk_100MHz = 0;
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	       forever
		    begin
		    #4; clk<=~clk;
			      clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
			 #2;
			 clk_100MHz<=~clk_100MHz;
		
end
end
 
endmodule

