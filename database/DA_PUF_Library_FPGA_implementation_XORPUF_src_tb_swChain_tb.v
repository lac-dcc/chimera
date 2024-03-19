`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:09:41 08/23/2015
// Design Name:   switchChain
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/APUF_SW_DOLUT/src/tb/swChain_tb.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: switchChain
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module swChain_tb;

	// Inputs
	reg inT;
	reg inB;
	reg [15:0] c;

	// Outputs
	wire outT;
	wire outB;

	// Instantiate the Unit Under Test (UUT)
	switchChain uut (
		.inT(inT), 
		.inB(inB), 
		.c(c), 
		.outT(outT), 
		.outB(outB)
	);

	initial begin
		// Initialize Inputs
		inT = 0;
		inB = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#100;
		inT = 1;
		inB = 1;
        
		// Add stimulus here

	end
      
endmodule

