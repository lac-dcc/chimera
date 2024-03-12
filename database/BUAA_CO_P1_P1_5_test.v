`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:18:05 10/25/2018
// Design Name:   string
// Module Name:   E:/Verilog/P1_5/test.v
// Project Name:  P1_5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: string
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
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	string uut (
		.clk(clk), 
		.clr(clr), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		in = 8'b00110001;	

		// Wait 100 ns for global reset to finish
		#10
		in = 8'b00101011;
		#10
		in = 8'b00110010;
		#10
		in = 8'b00101010;
		#10
		in = 8'b00110011;
        
		#30
		clr = 1;
		#10
		clr = 0;
		in = 8'b00110001;	
		#10
		in = 8'b00101011;
		#10
		in = 8'b00110010;
		#10
		in = 8'b00101010;
		#10
		in = 8'b00110011;
		
		// Add stimulus here

	end
     always #5 clk=~clk; 
endmodule

