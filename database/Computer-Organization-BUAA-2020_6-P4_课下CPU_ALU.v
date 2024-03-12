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
`define ADDU	3'b000
`define SUBU	3'b001
`define AND		3'b010
`define	OR		3'b011
`define	LUI		3'b100

module ALU(
    input [31:0] A,
    input [31:0] B,
    input [2:0] AluOp,
    output eq,
    output reg [31:0] res
    );
	assign eq = (A == B)? 1:0;
	always@(*) begin
		case(AluOp)
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
