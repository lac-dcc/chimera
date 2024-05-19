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

module multiplier (
	output [31:0] multiplier_result,
	input [31:0] op1,
	input [31:0] op2,
	input [1:0] mul_sel
);
	wire [63:0] sext_op1 = op1[31] ? {32'hFFFFFFFF, op1} : {32'h0, op1};
	wire [63:0] sext_op2 = op2[31] ? {32'hFFFFFFFF, op2} : {32'h0, op2};

	reg [63:0] result;

	always @ (*) begin
		case (mul_sel)
			`MUL_LO, `MUL_HI:
				result = $signed(sext_op1) * $signed(sext_op2);
			`MUL_HI_SU:
				result = $signed(sext_op1) * {32'h0, op2};
			`MUL_HI_UU:
				result = {32'h0, op1} * {32'h0, op2};
			default:
				result = 0;
		endcase
	end

	assign multiplier_result = (mul_sel == `MUL_LO) ? result[31:0] : result[63:0];
endmodule
