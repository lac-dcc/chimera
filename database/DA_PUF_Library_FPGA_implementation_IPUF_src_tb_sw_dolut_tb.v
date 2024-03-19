`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:45:35 08/23/2015
// Design Name:   sw_dolut
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/APUF_SW_DOLUT/src/tb/sw_dolut_tb.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sw_dolut
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sw_dolut_tb;

	// Inputs
	reg iT;
	reg iB;
	reg c;
	reg vcc;

	// Outputs
	wire oT;
	wire oB;

	// Instantiate the Unit Under Test (UUT)
	sw_dolut uut (
		.iT(iT), 
		.iB(iB), 
		.c(c), 
		.vcc(vcc), 
		.oT(oT), 
		.oB(oB)
	);

	initial begin
		// Initialize Inputs
		iT = 0;
		iB = 0;
		c = 0;
		vcc = 1'b1;

		// Wait 100 ns for global reset to finish
		#100;
		iT = 1;
		iB = 0;
		c = 0;
		
		#100;
		iT = 1;
		iB = 0;
		c = 1;
		
		#100;
		iT = 0;
		iB = 1;
		c = 0;
		
		#100;
		iT = 0;
		iB = 1;
		c = 1;
		
		#100;
		iT = 0;
		iB = 1;
		c = 1;
		
		#100;
		iT = 1;
		iB = 1;
		c = 1;
      

		
	end
      
endmodule

