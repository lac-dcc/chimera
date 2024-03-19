`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:57:10 08/23/2015
// Design Name:   apufClassic
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/APUF_SW_DOLUT/src/tb/apuClassic_tb3.v
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

module apuClassic_tb3;

	// Inputs
	reg clk;
	reg tigSignal;
	reg vcc;
	reg [63:0] c;

	// Outputs
	wire respReady;
	wire respBit;

	// Instantiate the Unit Under Test (UUT)
	apufClassic uut (
		.clk(clk), 
		.tigSignal(tigSignal), 
		.vcc(vcc), 
		.c(c), 
		.respReady(respReady), 
		.respBit(respBit)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		tigSignal = 0;
		vcc = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#100;
		vcc = 1;
        
		#100;
		tigSignal = 1;

	end
	
	always #50 clk = ~clk;
      
endmodule

