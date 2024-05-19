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

module branch_jump (
	output branch_taken,
	output [31:0] branch_target,

	output jump,
	output [31:0] jump_target,

	input [31:0] inst,
	input [31:0] pc,
	input [31:0] rd1,
	input [31:0] alu_out
);

	wire [6:0] opcode = inst[6:0];
	wire [2:0] funct3 = inst[9:7];
	wire [11:0] split_imm = {inst[31:27], inst[16:10]};
	wire [31:0] sext_split_imm = split_imm[11] ? {20'hFFFFF, split_imm} : {20'h0, split_imm};

	assign jump = (opcode == `OPCODE_J ||
	               opcode == `OPCODE_JAL ||
	               opcode == `OPCODE_JALR);

	wire [31:0] j_offset = inst[31] ? {6'h3F, inst[31:7], 1'b0} : {6'h0, inst[31:7], 1'b0};

	assign jump_target = (opcode == `OPCODE_J || opcode == `OPCODE_JAL) ? j_offset + pc : rd1;

	/* branch */
	assign branch_target = pc + ($signed(sext_split_imm) << 1);
	
	reg branch_sat;

	always @ (*) begin
		case (funct3)
			`F3_BEQ: branch_sat = (alu_out == 0);
			`F3_BNE: branch_sat = (alu_out != 0);
			`F3_BLT: branch_sat = (alu_out == 1);
			`F3_BGE: branch_sat = (alu_out != 1);
			`F3_BLTU: branch_sat = (alu_out == 1);
			`F3_BGEU: branch_sat = (alu_out != 1);
			default: branch_sat = 0;
		endcase
	end

	assign branch_taken = branch_sat && (opcode == `OPCODE_BRANCH);

endmodule
