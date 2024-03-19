`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:29:11 05/04/2018
// Design Name:   Adder_one
// Module Name:   D:/FPGA/Adder/test.v
// Project Name:  Adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder_one
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
	reg A;
	reg B;
	reg Ci;

	// Outputs
	wire F;
	wire Co;

	// Instantiate the Unit Under Test (UUT)
	Adder_one uut (
		.A(A), 
		.B(B), 
		.Ci(Ci), 
		.F(F), 
		.Co(Co)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Ci = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		A=0;B=0;Ci=0;
      #100 A=0;B=0;Ci=1;
      #100 A=0;B=1;Ci=0;
      #100 A=0;B=1;Ci=1;
      #100 A=1;B=0;Ci=0;
      #100 A=1;B=0;Ci=1;
      #100 A=1;B=1;Ci=0;
      #100 A=1;B=1;Ci=1;


	end
      
endmodule

