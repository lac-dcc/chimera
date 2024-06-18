// This program was cloned from: https://github.com/scluconn/DA_PUF_Library
// License: MIT License

`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:15:18 09/07/2015
// Design Name:   inputNetwork
// Module Name:   E:/Experiment/PUF_DESIGN/FPGA/UPDATED_PUF_DESIGN/Artix7/LSPUF_APUF_SW_DOLUT_64/src/tb/inputNetwork_tb_1.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: inputNetwork
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module inputNetwork_tb_1;

	// Inputs
	reg [63:0] x;

	// Outputs
	wire [63:0] y;

	// Instantiate the Unit Under Test (UUT)
	inputNetwork uut (
		.x(x), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		x = 64'b1101000011100111001000001110100110100001000110000100011110001100;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

