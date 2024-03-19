`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:12:51 09/05/2015
// Design Name:   inputNetwork
// Module Name:   C:/Users/DPS/Desktop/LSPUF_APUF_SW_DOLUT_64/src/tb/inputNetwork_tb.v
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

module inputNetwork_tb;

	// Inputs
	reg [7:0] x;

	// Outputs
	wire [7:0] y;
	wire [7:0] z;

	// Instantiate the Unit Under Test (UUT)
	inputNetwork uut (
		.x(x), 
		.y(y),
		.z(z)
	);

	initial begin
		// Initialize Inputs
		x = 8'b01101110;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

