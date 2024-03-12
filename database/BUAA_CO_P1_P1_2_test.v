`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:40:07 10/25/2018
// Design Name:   alu
// Module Name:   E:/Verilog/P1_2/test.v
// Project Name:  P1_2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
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
	reg [31:0] A;
	reg [31:0] B;
	reg [2:0] ALUOp;

	// Outputs
	wire [31:0] C;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.A(A), 
		.B(B), 
		.ALUOp(ALUOp), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		A = 32'b0001;
		B = 32'b1000;
		ALUOp = 3'b000;

		// Wait 100 ns for global reset to finish
		 #10;
       ALUOp = 3'b001;
		 #10;
       ALUOp = 3'b010;
		 #10;
       ALUOp = 3'b011;
		 #10;
		 A = 32'b10001000100010001111111111111111;
		 B = 32'b0010;
       ALUOp = 3'b100;
		 #10;
       ALUOp = 3'b101;
		// Add stimulus here

	end
      
endmodule

