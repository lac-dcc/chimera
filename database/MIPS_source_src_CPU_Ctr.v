// This program was cloned from: https://github.com/valar1234/MIPS
// License: GNU Lesser General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:22 12/29/2016 
// Design Name: 
// Module Name:    CPU_Ctr 
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
module CPU_Ctr(
input wire [31:0]       instruction,
output wire             regdst_flag,
output wire [1:0]       jump_flag,
output wire [1:0]       branch_flag,
output wire             memread_flag,
output wire             memtoReg_flag,
output wire [1:0]       ALUOp,
output wire             memwrite_flag,
output wire             ALUSrc_flag,
output wire             regwrite_flag
    );
	
	wire [5:0]         opcode;
	assign opcode = instruction[31:26];

	/* RegDst */
	assign regdst_flag = (opcode == `OPCODE_R) ? 1'b1 : 1'b0;
	
	/* Jump */
	assign jump_flag = JUMP( instruction );
	function [1:0] JUMP;
	input [31:0]       instruction;
	begin
	   if( instruction[31:26] == `OPCODE_J_JUMP )
	       JUMP = `JUMP_J;
	   else if( instruction[31:26] == `OPCODE_JAL_JUMP )
	       JUMP = `JUMP_JAL;
	   else if( (instruction[31:26] == `OPCODE_R && instruction[5:0] == `R_FUNC_JR) )
	       JUMP = `JUMP_JR;
	   else
	       JUMP = 2'b00;
	end
	endfunction
	
	/* Branch */
	assign branch_flag = BRANCH( opcode );
	function [1:0]	BRANCH;
		input [5:0] opcode;
		begin
			case( opcode )
			`OPCODE_I_BEQ: BRANCH = `BRANCH_OP_BEQ;
			`OPCODE_I_BNE: BRANCH = `BRANCH_OP_BNE;
			default: 		BRANCH = 2'b00;
			endcase
		end
	endfunction
	
	/* MemRead */
	assign memread_flag = (opcode == `OPCODE_I_LW) ? 1'b1 : 1'b0;
	
	/* MemToReg */
	assign memtoReg_flag = (opcode == `OPCODE_I_LW) ? 1'b1 : 1'b0;
	
	/* MemWrite */
	assign memwrite_flag = (opcode == `OPCODE_I_SW) ? 1'b1 : 1'b0;
	
	/* ALUSrc */
	assign ALUSrc_flag = ALUSRC( opcode );
	function ALUSRC;
		input [5:0] opcode;
		begin
			if( opcode[5:3] == `OPCODE_I_MASK)
				ALUSRC = 1'b1;
			else
				case( opcode )
				`OPCODE_I_LW: 	ALUSRC = 1'b1;
				`OPCODE_I_SW: 	ALUSRC = 1'b1;
				default:		ALUSRC = 1'b0;
				endcase
		end
	endfunction

	/* RegWrite */
	assign regwrite_flag = REGWRITE( opcode, instruction );
	function REGWRITE;
		input [5:0]	opcode;
		input [31:0] instruction;
		begin
		    if( instruction == `NOP )
		         REGWRITE = 1'b0; 
		    else if( opcode == `OPCODE_JAL_JUMP )
		         REGWRITE = 1'b1;
			else if( opcode[5:3] == `OPCODE_I_MASK)
				REGWRITE = 1'b1;
			else if( opcode == `OPCODE_I_LW)
			     REGWRITE = 1'b1;
			else if( opcode == `OPCODE_R )
			begin
			     if( instruction[5:0] == `R_FUNC_JR)
			         REGWRITE = 1'b0;
			     else
			         REGWRITE = 1'b1;
			end
			else
			     REGWRITE = 1'b0;
		end
	endfunction

	/* ALUOp */
	assign ALUOp = OP( opcode );
	function [1:0]	OP;
		input [5:0]	opcode;
		begin
			if( opcode[5:3] == `OPCODE_I_MASK)
				OP = 2'b11;
			else
				case( opcode )
				`OPCODE_I_SW:  OP = 2'b00;
				`OPCODE_I_LW:  OP = 2'b00;
				`OPCODE_I_BEQ: OP = 2'b01;
				`OPCODE_I_BNE: OP = 2'b01;
				`OPCODE_R:	   OP = 2'b10;
				default:	   OP = 2'b00;
				endcase
		end
	endfunction
	

endmodule
