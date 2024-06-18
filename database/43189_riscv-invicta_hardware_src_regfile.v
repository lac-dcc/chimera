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

module regfile (
	input clk,
	input reset,
	output [31:0] rd1, 
	output [31:0] rd2,
	input [4:0] rs1, 
	input [4:0] rs2, 
	input [4:0] wd,
	input [31:0] w_data,
	input w_enable,
	input stall);

	/* Registers */
	reg [31:0] registers[31:0];

	always @ (posedge clk) begin
		if (w_enable & !stall & wd != 0)
			registers[wd] <= w_data;
	end

	/* Outputs */
	assign rd1 = rs1 == 0 ? 32'b0 : registers[rs1];
	assign rd2 = rs2 == 0 ? 32'b0 : registers[rs2];

endmodule
