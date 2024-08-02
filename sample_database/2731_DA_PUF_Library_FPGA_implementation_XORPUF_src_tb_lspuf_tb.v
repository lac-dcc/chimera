// This program was cloned from: https://github.com/scluconn/DA_PUF_Library
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:25:16 09/06/2015
// Design Name:   lspuf
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/LSPUF_APUF_SW_DOLUT_64/src/tb/lspuf_tb.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lspuf
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lspuf_tb;

	// Inputs
	reg clk;
	reg tigSignal;
	reg [15:0] c;

	// Outputs
	wire respReady;
	wire [9:0] respBitA;
	wire [8:0] respBits;

	// Instantiate the Unit Under Test (UUT)
	lspuf uut (
		.clk(clk), 
		.tigSignal(tigSignal), 
		.c(c), 
		.respReady(respReady), 
		.respBitA(respBitA), 
		.respBits(respBits)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		tigSignal = 0;
		c = 64'hafbaafbaafbaafb;

		// Wait 100 ns for global reset to finish
		#500;
		tigSignal = 1;
        
		// Add stimulus here

	end
   
	always #50 clk = ~clk;
	
endmodule

