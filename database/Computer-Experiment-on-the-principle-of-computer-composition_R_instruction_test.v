`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:07:50 06/01/2018
// Design Name:   top_R_cpu
// Module Name:   D:/FPGA/R_instruction/test.v
// Project Name:  R_instruction
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_R_cpu
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
	reg clk;

	// Outputs
	wire ZF;
	wire OF;
	wire [31:0] F;

	// Instantiate the Unit Under Test (UUT)
	top_R_cpu uut (
		.rst(rst), 
		.clk(clk), 
		.ZF(ZF), 
		.OF(OF), 
		.F(F)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk=1;
		// Add stimulus here	
		
		forever
		begin
		    #50;
		    clk=~clk;
		end
end
      


      
endmodule

