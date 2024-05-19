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

module alu (
	output reg [31:0] alu_out,
	input [31:0] op1,
	input [31:0] op2,
	input [31:0] multiplier_result,
	input [4:0] alu_sel
);
	always @ (*) begin
		case (alu_sel)
			`ALU_ADD:  alu_out = op1 + op2;
			`ALU_SLL:  alu_out = op1 << op2;
			`ALU_SLT:  alu_out = $signed(op1) < $signed(op2) ? 1 : 0;
			`ALU_SLTU: alu_out = op1 < op2 ? 1 : 0;
			`ALU_XOR:  alu_out = op1 ^ op2;
			`ALU_SRL:  alu_out = op1 >> op2;
			`ALU_SRA:  alu_out = $signed(op1) >>> op2;
			`ALU_OR:   alu_out = op1 | op2;
			`ALU_AND:  alu_out = op1 & op2;
			`ALU_MUL:  alu_out = multiplier_result;
			`ALU_DIV:  alu_out = $signed(op1) / $signed(op2);
			`ALU_DIVU: alu_out = op1 / op2;
			`ALU_REM:  alu_out = $signed(op1) % $signed(op2);
			`ALU_REMU: alu_out = op1 % op2;
			`ALU_LUI:  alu_out = op1 << 12;
			`ALU_NONE: alu_out = 0;
		endcase
	end

endmodule
	
