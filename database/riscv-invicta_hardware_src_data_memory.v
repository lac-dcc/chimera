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

module data_memory (
	input [31:0] inst,
	input [31:0] data,
	input [31:0] addr,

	output [31:0] memory_addr,

	output reg [31:0] write_data,
	output reg [3:0] write_mask,

	input [31:0] load_data,
	output reg [31:0] output_data
);

	wire [2:0] funct3 = inst[9:7];
	wire [6:0] opcode = inst[6:0];

	assign memory_addr = {addr[31:2], 2'b0};

	reg [31:0] write_data_masked;

	always @ (*) begin
		case (funct3)
			`F3_SB: write_data_masked = data & 32'hFF;
			`F3_SH: write_data_masked = data & 32'hFFFF;
			`F3_SW: write_data_masked = data & 32'hFFFFFFFF;
			default: write_data_masked = 32'h0;
		endcase
	end

	always @ (*) begin
		case (addr[1:0])
			2'b00: write_data = write_data_masked;
			2'b01: write_data = write_data_masked << 8;
			2'b10: write_data = write_data_masked << 16;
			2'b11: write_data = write_data_masked << 24;
			default: write_data = 32'b0;
		endcase
	end

	always @ (*) begin
		case (funct3)
			`F3_SB: write_mask =    4'b1 << addr[1:0];
			`F3_SH: write_mask =   4'b11 << addr[1:0];
			`F3_SW: write_mask = 4'b1111;
			default: write_mask = 0;
		endcase
	end

	reg [31:0] load_data_shifted;

	always @ (*) begin
		case (funct3)
			`F3_LB, `F3_LBU: case (addr[1:0])
				2'b00: load_data_shifted = {24'b0, load_data[7:0]};
				2'b01: load_data_shifted = {24'b0, load_data[15:8]};
				2'b10: load_data_shifted = {24'b0, load_data[23:16]};
				2'b11: load_data_shifted = {24'b0, load_data[31:24]};
				default: load_data_shifted = 32'b0;
			endcase
			
			`F3_LH, `F3_LHU: case (addr[1:0])
				2'b00: load_data_shifted = {16'b0, load_data[15:0]};
				2'b10: load_data_shifted = {16'b0, load_data[31:16]};
				default: load_data_shifted = 32'b0;
			endcase

			`F3_LW: load_data_shifted = load_data;

			default: load_data_shifted = 32'b0;
		endcase
	end

	wire [31:0] lds = load_data_shifted;

	always @ (*) begin
		case (funct3)
			`F3_LB: output_data = lds[7] ? {24'hFFFFFF, lds[7:0]} : {24'h0, lds[7:0]};
			`F3_LH: output_data = lds[15] ? {16'hFFFF, lds[15:0]} : {16'h0, lds[15:0]};
			`F3_LW, `F3_LHU, `F3_LBU: output_data = lds;
			default: output_data = 32'b0;
		endcase
	end

endmodule
