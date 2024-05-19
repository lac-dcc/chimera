// This program was cloned from: https://github.com/qmn/riscv-invicta
// License: BSD 2-Clause "Simplified" License

/* 
 * Copyright (c) 2013, Quan Nguyen
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 *     Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *     Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

`include "consts.vh"

module alu_dec (
	output reg [4:0] alu_sel,
	output [1:0] mul_sel,
	output reg [31:0] op1,
	output reg [31:0] op2,
	input [31:0] rs1,
	input [31:0] rs2,
	input [31:0] inst
);

	wire [6:0] opcode = inst[6:0];
	wire [9:7] funct3 = inst[9:7];
	wire [4:0] shamt = inst[14:10];

	wire [11:0] imm12 = inst[21:10];
	wire [31:0] s_ext_imm = imm12[11] ? {20'hFFFFF, imm12} : {20'b0, imm12};
	wire [31:0] z_ext_imm = {20'b0, imm12};
	wire [19:0] lui_imm = inst[26:7];

	wire [4:0] imm12hi = inst[31:27];
	wire [6:0] imm12lo = inst[16:10];
	wire [11:0] split_imm12 = {imm12hi, imm12lo};

	reg [3:0] compute_sel;
	
	always @ (*) begin
		/* op1 */
		op1 = (opcode == `OPCODE_LUI) ? {12'b0, lui_imm} : rs1;

		/* op2 */
		case (opcode)
			`OPCODE_OP_IMM:
				case (funct3)
					/* sign-extended immediate */
					`F3_ADD, `F3_SLT, `F3_SLTU, `F3_XOR, `F3_OR, `F3_AND:
						op2 = s_ext_imm;
					/* shifts */
					`F3_SLL, `F3_SR:
						op2 = shamt;
					default:
						op2 = 0;
				endcase

			`OPCODE_STORE:
				op2 = split_imm12;
			`OPCODE_LOAD:
				op2 = imm12;
			`OPCODE_OP:
				/* subtraction */
				op2 = (funct3 == `F3_ADD && inst[16]) ? -rs2 : rs2;
			default:
				op2 = rs2;
		endcase

		/* compute_sel, for integer computes with[out] immediates */
		case (funct3)
			`F3_ADD:  compute_sel = `ALU_ADD;
			`F3_SLL:  compute_sel = `ALU_SLL;
			`F3_SLT:  compute_sel = `ALU_SLT;
			`F3_SLTU: compute_sel = `ALU_SLTU;
			`F3_XOR:  compute_sel = `ALU_XOR;
			`F3_SR:   compute_sel = inst[16] ? `ALU_SRA : `ALU_SRL;
			`F3_OR:   compute_sel = `ALU_OR;
			`F3_AND:  compute_sel = `ALU_AND;
			default:  compute_sel = `ALU_NONE;
		endcase
		
		/* alu_sel */
		case (opcode)
			`OPCODE_OP:
				/* inst[10] indicates the multiplication/division operations */
				if (inst[10] == 1'b1) begin
					case (funct3)
						`F3_MUL:  alu_sel = `ALU_MUL;
						`F3_DIV:  alu_sel = `ALU_DIV;
						`F3_DIVU: alu_sel = `ALU_DIVU;
						`F3_REM:  alu_sel = `ALU_REM;
						`F3_REMU: alu_sel = `ALU_REMU;
						default: alu_sel = `ALU_NONE;
					endcase
				end else begin
					alu_sel = compute_sel;
				end

			`OPCODE_OP_IMM:
				alu_sel = compute_sel;

			`OPCODE_LOAD, `OPCODE_STORE:
				alu_sel = `ALU_ADD;

			`OPCODE_LUI:
				alu_sel = `ALU_LUI;

			`OPCODE_BRANCH:
				case (funct3)
					`F3_BEQ, `F3_BNE:   alu_sel = `ALU_XOR;
					`F3_BLT, `F3_BGE:   alu_sel = `ALU_SLT;
					`F3_BLTU, `F3_BGEU: alu_sel = `ALU_SLTU;
					default: alu_sel = `ALU_NONE;
				endcase

			default:
				alu_sel = `ALU_NONE;
		endcase

	end

	/* mul_sel - it maps directly on the funct bits */
	assign mul_sel = inst[8:7];
endmodule
