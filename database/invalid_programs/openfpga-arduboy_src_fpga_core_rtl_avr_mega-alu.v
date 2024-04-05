/*
 * This IP is the MEGA/XMEGA ALU implementation.
 * 
 * Copyright (C) 2018  Iulian Gheorghiu (morgoth.creator@gmail.com)
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

`timescale 1ns / 1ps

`include "mega-def.v"

module mega_alu # (
	parameter PLATFORM = "XILINX",
	parameter CORE_TYPE = `MEGA_XMEGA_1,
	parameter COMASATE_MUL = "FALSE"
	)(
	input [15:0]inst,
	input [4:0]rda,
	input [15:0]rd,
	input [4:0]rra,
	input [15:0]rr,
	output reg [15:0]R,
	input [7:0]sreg_in,
	output reg[7:0]sreg_out
);

//#pragma HLS RESOURCE variable=temp core=FMul_nodsp
wire signed [7:0]mul_s_a = rd;
wire signed [7:0]mul_s_b = rr;
wire signed [8:0]mul_su_b = {1'b0, rr};
wire [15:0]mul_result_u_int;
wire signed [15:0]mul_result_s_int;
wire signed [15:0]mul_result_s_u_int;

reg [7:0]mul_a;
reg [7:0]mul_b;

// (* use_dsp = "yes" *)
assign mul_result_u_int = COMASATE_MUL != "TRUE" ? (rd * rr) : (mul_a * mul_b);
// (* use_dsp = "yes" *)
assign mul_result_s_int = mul_s_a * mul_s_b;
// (* use_dsp = "yes" *)
assign mul_result_s_u_int = mul_s_a * mul_su_b;

wire in_addr_1_and_2_equal = rda == rra;
wire RD_8_IS_ZERO = &(~R[7:0]);
wire RD_16_IS_ZERO = &(~R);

always @ *
begin
	sreg_out = sreg_in;
	R = 16'h0000;
	//R = rr;
	mul_a = rd;
	mul_b = rr;
	casex({CORE_TYPE, inst})
		`INSTRUCTION_MOV: 
		begin
			R[7:0] = rr[7:0];
		end
		`INSTRUCTION_MOVW: 
		begin
			R = rr;
		end
		`INSTRUCTION_MUL:
		begin
			R = mul_result_u_int;
			sreg_out[`XMEGA_FLAG_C] = R[15];
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_MULS:
		begin
			mul_a = {1'b0, rd[7] ? 128 - rd[6:0] : rd[6:0]};
			mul_b = {1'b0, rr[7] ? 128 - rr[6:0] : rr[6:0]};
			if(COMASATE_MUL != "TRUE")
				R = mul_result_s_int;
			else
				R = {rd[7] ^ rr[7], mul_result_u_int[14:0]};
			sreg_out[`XMEGA_FLAG_C] = R[15];
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_MULSU:
		begin
			mul_a[7] = {1'b0, rd[7] ? 128 - rd[6:0] : rd[6:0]};
			if(COMASATE_MUL != "TRUE")
				R = mul_result_s_u_int;
			else
				R = {rd[7], mul_result_u_int[14:0]};
			sreg_out[`XMEGA_FLAG_C] = R[15];
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_FMUL:
		begin
			{sreg_out[`XMEGA_FLAG_C], R} = {mul_result_u_int, 1'b0};
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_FMULS:
		begin
			mul_a = {1'b0, rd[7] ? 128 - rd[6:0] : rd[6:0]};
			mul_b = {1'b0, rr[7] ? 128 - rr[6:0] : rr[6:0]};
			if(COMASATE_MUL != "TRUE")
				{sreg_out[`XMEGA_FLAG_C], R} = {mul_result_s_int, 1'b0};
			else
				{sreg_out[`XMEGA_FLAG_C], R} = {rd[7] ^ rr[7], mul_result_u_int[14:0], 1'b0};
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_FMULSU:
		begin
			mul_a = {1'b0, rd[7] ? 128 - rd[6:0] : rd[6:0]};
			if(COMASATE_MUL != "TRUE")
				{sreg_out[`XMEGA_FLAG_C], R} = {mul_result_s_u_int, 1'b0};
			else
				{sreg_out[`XMEGA_FLAG_C], R} = {rd[7], mul_result_u_int[14:0], 1'b0};
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_SUB: 
		begin
			R[7:0] = rd[7:0] - rr[7:0];
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & rr[7]), (rr[7] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & rr[3]), (rr[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~rr[7], ~R[7]}), (&{~rd[7], rr[7], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_SBC: 
		begin
			R[7:0] = rd[7:0] - rr[7:0] - sreg_in[`XMEGA_FLAG_C];
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & rr[7]), (rr[7] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & rr[3]), (rr[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~rr[7], ~R[7]}), (&{~rd[7], rr[7], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = &{~R[7:0], sreg_in[`XMEGA_FLAG_Z]};
		end
		`INSTRUCTION_ADD:
		begin
			R[7:0] = rd[7:0] + rr[7:0];
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
			if(in_addr_1_and_2_equal)
			begin // LSL
				sreg_out[`XMEGA_FLAG_C] = rd[7];
				sreg_out[`XMEGA_FLAG_H] = rd[3];
				sreg_out[`XMEGA_FLAG_V] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_C];
				sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			end
			else
			begin // ADD
				sreg_out[`XMEGA_FLAG_C] = |{(rd[7] & rr[7]), (rr[7] & ~R[7]), (~R[7] & rd[7])};
				sreg_out[`XMEGA_FLAG_H] = |{(rd[3] & rr[3]), (rr[3] & ~R[3]), (~R[3] & rd[3])};
				sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], rr[7], ~R[7]}), (&{~rd[7], ~rr[7], R[7]})};
				sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			end
		end
		`INSTRUCTION_ADC: 
		begin
			R[7:0] = rd[7:0] + rr[7:0] + {7'h0, sreg_in[`XMEGA_FLAG_C]};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
			if(in_addr_1_and_2_equal)
			begin // ROL
				sreg_out[`XMEGA_FLAG_C] = rd[7];
				sreg_out[`XMEGA_FLAG_H] = rd[3];
				sreg_out[`XMEGA_FLAG_V] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_C];
				sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			end
			else
			begin // ADC
				sreg_out[`XMEGA_FLAG_C] = |{(rd[7] & rr[7]), (rr[7] & ~R[7]), (~R[7] & rd[7])};
				sreg_out[`XMEGA_FLAG_H] = |{(rd[3] & rr[3]), (rr[3] & ~R[3]), (~R[3] & rd[3])};
				sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], rr[7], ~R[7]}), (&{~rd[7], ~rr[7], R[7]})};
				sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			end
		end
		`INSTRUCTION_AND:
		begin // AND, TST
			R[7:0] = rd[7:0] & rr[7:0];
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_EOR:
		begin
			R[7:0] = rd[7:0] ^ rr[7:0];
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_OR:
		begin
			R[7:0] = rd[7:0] | rr[7:0];
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_SUBI:
		begin
			R[7:0] = rd[7:0] - {inst[11:8], inst[3:0]};
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & inst[11]), (inst[11] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & inst[3]), (inst[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~inst[11], ~R[7]}), (&{~rd[7], inst[11], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_SBCI:
		begin
			R[7:0] = rd[7:0] - {inst[11:8], inst[3:0]} - {7'h00, sreg_in[`XMEGA_FLAG_C]};
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & inst[11]), (inst[11] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & inst[3]), (inst[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~inst[11], ~R[7]}), (&{~rd[7], inst[11], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = &{~R[7:0], sreg_in[`XMEGA_FLAG_Z]};
		end
		`INSTRUCTION_ORI_SBR:
		begin
			R[7:0] = rd | {inst[11:8], inst[3:0]};
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_ANDI_CBR:
		begin
			R[7:0] = rd & {inst[11:8], inst[3:0]};
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_COM:
		begin
			R[7:0] = 8'hFF - rd[7:0];
			sreg_out[`XMEGA_FLAG_C] = 1'b1;
			sreg_out[`XMEGA_FLAG_V] = 1'b0;
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_NEG:
		begin
			R[7:0] = 8'h00 - rd[7:0];
			sreg_out[`XMEGA_FLAG_C] = |R[7:0];
			sreg_out[`XMEGA_FLAG_H] = R[3] | ~rd[3];
			sreg_out[`XMEGA_FLAG_V] = &{R[7], ~R[6:0]};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_SWAP:
		begin
			R[7:0] = {rd[3:0] , rd[7:4]};
		end
		`INSTRUCTION_INC:
		begin
			R[7:0] = rd[7:0] + 8'd1;
			sreg_out[`XMEGA_FLAG_V] = &{R[7], ~R[6:0]};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_DEC:
		begin
			R[7:0] = rd[7:0] - 8'd1;
			sreg_out[`XMEGA_FLAG_V] = &{~R[7], R[6:0]};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_ASR:
		begin
			R[7:0] = {rd[7], rd[7:1]};
			sreg_out[`XMEGA_FLAG_C] = rd[0];
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_V] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_C];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_LSR:
		begin
			R[7:0] = {1'b0, rd[7:1]};
			sreg_out[`XMEGA_FLAG_C] = rd[0];
			sreg_out[`XMEGA_FLAG_N] = 1'b0;
			sreg_out[`XMEGA_FLAG_V] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_C];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_ROR:
		begin
			R[7:0] = {sreg_in[`XMEGA_FLAG_C], rd[7:1]};
			sreg_out[`XMEGA_FLAG_C] = rd[0];
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_V] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_C];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_CP:
		begin
			R[7:0] = rd[7:0] - rr[7:0];
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & rr[7]), (rr[7] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & rr[3]), (rr[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~rr[7], ~R[7]}), (&{~rd[7], rr[7], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_CPC:
		begin
			R[7:0] = rd[7:0] - rr[7:0] - {7'h00, sreg_in[`XMEGA_FLAG_C]};
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & rr[7]), (rr[7] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & rr[3]), (rr[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~rr[7], ~R[7]}), (&{~rd[7], rr[7], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = &{~R[7:0], sreg_in[`XMEGA_FLAG_Z]};
		end
		`INSTRUCTION_CPI:
		begin
			R[7:0] = rd[7:0] - {inst[11:8], inst[3:0]};
			sreg_out[`XMEGA_FLAG_C] = |{(~rd[7] & inst[11]), (inst[11] & R[7]), (R[7] & ~rd[7])};
			sreg_out[`XMEGA_FLAG_H] = |{(~rd[3] & inst[3]), (inst[3] & R[3]), (R[3] & ~rd[3])};
			sreg_out[`XMEGA_FLAG_V] = |{(&{rd[7], ~inst[11], ~R[7]}), (&{~rd[7], inst[11], R[7]})};
			sreg_out[`XMEGA_FLAG_N] = R[7];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_8_IS_ZERO;
		end
		`INSTRUCTION_SEx_CLx:
		begin
			sreg_out[inst[6:4]] = ~inst[7];
		end
		`INSTRUCTION_ADIW:
		begin
			R = {1'b0, rd} + {inst[7:6], inst[3:0]};
			sreg_out[`XMEGA_FLAG_C] = ~R[15] & rd[15];
			sreg_out[`XMEGA_FLAG_V] = R[15] & ~rd[15];
			sreg_out[`XMEGA_FLAG_N] = R[15];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_SBIW:
		begin
			R = {1'b0, rd} - {inst[7:6], inst[3:0]};
			sreg_out[`XMEGA_FLAG_C] = R[15] & ~rd[15];
			sreg_out[`XMEGA_FLAG_V] = ~R[15] & rd[15];
			sreg_out[`XMEGA_FLAG_N] = R[15];
			sreg_out[`XMEGA_FLAG_S] = sreg_out[`XMEGA_FLAG_N] ^ sreg_out[`XMEGA_FLAG_V];
			sreg_out[`XMEGA_FLAG_Z] = RD_16_IS_ZERO;
		end
		`INSTRUCTION_LDI:
		begin
			R[7:0] = {inst[11:8], inst[3:0]};
		end
		`INSTRUCTION_BLD:
		begin
			if(sreg_in[`XMEGA_FLAG_T])
				R[7:0] = rd[7:0] | (2 ** inst[2:0]);
			else
				R[7:0] = rd[7:0] & ~(2 ** inst[2:0]);
		end
		`INSTRUCTION_BST:
		begin
			sreg_out[`XMEGA_FLAG_T] = rd[inst[2:0]];
		end
		/*default:
		begin
			sreg_out = sreg_in;
			R = 16'h0000;
		end*/
	endcase
end
endmodule