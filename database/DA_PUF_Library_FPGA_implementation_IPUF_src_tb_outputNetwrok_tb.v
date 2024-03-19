`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:08:22 09/05/2015
// Design Name:   outputNetwork
// Module Name:   C:/Users/DPS/Desktop/LSPUF_APUF_SW_DOLUT_64/src/tb/outputNetwrok_tb.v
// Project Name:  isePro
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: outputNetwork
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module outputNetwrok_tb;

	// Inputs
	reg [9:0] in;

	// Outputs
	wire [8:0] out;

	// Instantiate the Unit Under Test (UUT)
	outputNetwork uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 10'b01010101110;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

