// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/22 16:16:07
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "opcode.h"

module alu(
	input CLK,
	input RST,
	
	input [`ALU_OPCODE_WIDTH-1:0] 	opcode,
	input [31:0] 					src1,
	input [31:0]					src2,
	output reg [31:0] 				result,
	
	output reg busy,
	output reg done
	);
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			result <= 0;
			busy <= 0;
			done <= 0;
		end else begin
			done <= 1;
			busy <= 0;
			case(opcode)
			`ALU_ADD:	result <= src1 + src2;
			`ALU_ADDU:	result <= src1 + src2;
			`ALU_SUB:	result <= src1 - src2;
			`ALU_SUBU:	result <= src1 - src2;
			`ALU_AND:	result <= src1 & src2;
			`ALU_OR:	result <= src1 | src2;
			`ALU_NOR:	result <= ~(src1 | src2);
			`ALU_XOR:	result <= src1 ^ src2;
			`ALU_SLL:	result <= src2 << src1[4:0];
			`ALU_SRL:	result <= src2 >> src1[4:0];
			`ALU_SRA:	result <= $signed(src2) >>> src1[4:0];
			`ALU_ROR:	result <= (src2 >> src1[4:0]) | (src2 << (32-src1[4:0]));
			`ALU_SEQ:	result <= src1 == src2 ? 32'b1 : 32'b0;
			`ALU_SLT:	result <= $signed(src1) < $signed(src2) ? 32'b1 : 32'b0;
			`ALU_SLTU:	result <= src1 < src2 ? 32'b1 : 32'b0;
			default:	done <= 0;
			endcase
		end
	end
endmodule
