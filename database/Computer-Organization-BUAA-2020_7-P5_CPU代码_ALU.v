`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:51:37 11/17/2020 
// Design Name: 
// Module Name:    ALU 
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
// do not include the macros.v !!!
`define ADDU	4'b0000
`define SUBU	4'b0001
`define AND		4'b0010
`define	OR		4'b0011
`define	LUI		4'b0100

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUOp,
    output reg [31:0] res
    );
	always@(*) begin
		case(ALUOp)
			`ADDU :
				res = A + B;
			`SUBU :
				res = A - B;
			`AND :
				res = A & B;
			`OR :
				res = A | B;
			`LUI:
				res = {B[15:0], 16'h0};
			default:
				res = 0;
		endcase
	end
endmodule
