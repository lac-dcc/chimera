// This program was cloned from: https://github.com/scluconn/DA_PUF_Library
// License: MIT License


////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:56:35 08/23/2015
// Design Name:   apufClassic
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/APUF_SW_DOLUT/src/tb/apufClassic_tb.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: apufClassic
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module apufClassic_tb;

	// Inputs
	reg clk;
	reg tigSignal;
	reg vcc;
	reg [63:0] c;

	// Outputs
	wire respReady;
	wire respBit;
	wire pathT, pathB,tigReg;

	// Instantiate the Unit Under Test (UUT)
	apufClassic uut (
		.clk(clk), 
		.tigSignal(tigSignal), 
		.vcc(vcc), 
		.c(c), 
		.respReady(respReady), 
		.respBit(respBit),
		.pathT(pathT),
		.pathB(pathB),
		.tigReg(tigReg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		tigSignal = 0;
		vcc = 0;
		c = 0;

		#100;
		vcc = 1;
		
		#100;
		tigSignal = 0;
		
		
	end
	
	always #100 clk = ~clk;
      
endmodule

