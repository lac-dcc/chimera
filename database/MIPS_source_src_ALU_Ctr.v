// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:46 12/29/2016 
// Design Name: 
// Module Name:    ALU_Ctr 
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
`include "macros.v"
module ALU_Ctr(
input wire [5:0]	opcode,
input wire [5:0]	funct,
input wire [1:0]	ALUOp,
output wire [3:0] cmd
    );
	 
						
	/* the ALU command */
	assign cmd = OUT( funct, ALUOp);
	 
	 /* the first-level decode */
	 function [3:0]	OUT;
		input [5:0] funct;
		input [1:0] ALUOp;
		case( ALUOp )
		2'b00: OUT = `ALU_ADD;
		2'b01: OUT = `ALU_SUB;
		2'b10: OUT = DECODE( funct );
		2'b11: OUT = DECODE2( opcode );
		default: OUT = 4'bxxxx;
		endcase
	 endfunction
	 
	 /* the second-level decode */
	 function [3:0] DECODE;
		input [5:0] funct;
		case( funct )
		`R_OP_AND: 	DECODE = `ALU_AND;
		`R_OP_OR:  	DECODE = `ALU_OR;
		`R_OP_ADD: 	DECODE = `ALU_ADD;
		`R_OP_SUB: 	DECODE = `ALU_SUB;
		`R_OP_SLT: 	DECODE = `ALU_SLT;
		`R_OP_NOR: 	DECODE = `ALU_NOR;
		`R_OP_SLLV:	DECODE = `ALU_SLLV;
		`R_OP_SRLV:	DECODE = `ALU_SRLV;
		default: DECODE = 4'bxxxx;
		endcase
	 endfunction
	 
	 /* the third-level decode */
	 function [3:0] DECODE2;
		input [5:0] opcode;
		begin
			case( opcode )
			`OPCODE_I_ADDI: DECODE2 = `ALU_ADD;
			`OPCODE_I_ANDI: DECODE2 = `ALU_AND;
			`OPCODE_I_ORI:	 DECODE2 = `ALU_OR;
			`OPCODE_I_XORI: DECODE2 = `ALU_XOR;
			`OPCODE_I_LUI:	 DECODE2 = `ALU_LU;
			default:			 DECODE2 = 4'bxxxx;
			endcase
		end
	 endfunction


endmodule
