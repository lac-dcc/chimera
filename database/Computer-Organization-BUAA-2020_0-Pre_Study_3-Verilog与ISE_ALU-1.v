`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:02 07/07/2020 
// Design Name: 
// Module Name:    fun 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(
	input  [3:0] inA,
	input  [3:0] inB,
	input  [1:0] op,
	output [3:0] ans
    );
	
//利用三目运算符完成运算

assign ans = (op == 2'b00) ? inA & inB :
				 (op == 2'b01) ? inA | inB :
				 (op == 2'b10) ? inA ^ inB :
				 (op == 2'b11) ? inA + inB 
													: 4'b000 ; //error

	
endmodule
