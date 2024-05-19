// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: dispatch
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-11 15:39:15
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-17 09:22:17
*/

/*
  Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

`timescale 1 ns / 1 ps
`include "define.vh"

module dispatch (

	//for rename
	output [ `RB*32 - 1 :0 ] rnAct_X_dnxt,
	input [ `RB*32 - 1 :0 ] rnAct_X_qout,

	output [32*`RP-1 : 0] rnBufU_rename_set,
	input [32*`RP-1 : 0] rnBufU_qout,


	//from instr fifo
	input [`DECODE_INFO_DW-1:0] decode_microInstr_pop,
	output instrFifo_pop,
	input instrFifo_empty,

	output [`REORDER_INFO_DW-1:0] dispat_info,
	output reOrder_fifo_push,
	input reOrder_fifo_full,

	//to issue
	output alu_buffer_push,
	input alu_buffer_full,
	output [`ALU_ISSUE_INFO_DW-1:0] alu_dispat_info,

	output bru_fifo_push,
	input bru_fifo_full,
	output [`BRU_ISSUE_INFO_DW-1:0] bru_dispat_info,

	output lsu_fifo_push,
	input lsu_fifo_full,
	output [`LSU_ISSUE_INFO_DW-1:0] lsu_dispat_info,
	input lsu_fifo_empty,

	output csr_fifo_push,
	input csr_fifo_full,
	output [`CSR_ISSUE_INFO_DW-1:0] csr_dispat_info,

	output mul_fifo_push,
	input mul_fifo_full,
	output [`MUL_ISSUE_INFO_DW-1:0] mul_dispat_info

);


	wire [4:0] rd0_raw;
	wire [4:0] rs1_raw;
	wire [4:0] rs2_raw;

	wire [5+`RB-1:0] rs1_reName;
	wire [5+`RB-1:0] rs2_reName;
	wire [5+`RB-1:0] rd0_reName;

	wire dispat_valid = (~instrFifo_empty) & (~rd0_runOut) & (~reOrder_fifo_full);

	wire rv64i_lui, rv64i_auipc;
	wire rv64i_jal, rv64i_jalr, rv64i_beq, rv64i_bne, rv64i_blt, rv64i_bge, rv64i_bltu, rv64i_bgeu;
	wire rv64i_lb, rv64i_lh, rv64i_lw, rv64i_lbu, rv64i_lhu, rv64i_lwu, rv64i_ld;
	wire rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd;
	wire rv64i_addi, rv64i_addiw, rv64i_slti, rv64i_sltiu, rv64i_xori, rv64i_ori, rv64i_andi, rv64i_slli, rv64i_slliw, rv64i_srli, rv64i_srliw, rv64i_srai, rv64i_sraiw;
	wire rv64i_add, rv64i_addw, rv64i_sub, rv64i_subw, rv64i_sll, rv64i_sllw, rv64i_slt, rv64i_sltu, rv64i_xor, rv64i_srl, rv64i_srlw, rv64i_sra, rv64i_sraw, rv64i_or, rv64i_and;
	wire rv64i_fence, rv64zi_fence_i;
	wire rv64csr_rw, rv64csr_rs, rv64csr_rc, rv64csr_rwi, rv64csr_rsi, rv64csr_rci;
	wire privil_ecall, privil_ebreak, privil_mret;
	wire rv64m_mul, rv64m_mulh, rv64m_mullhsu, rv64m_mulhu, rv64m_div, rv64m_divu, rv64m_rem, rv64m_remu, rv64m_mulw, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw;
	wire privil_accessFault, privil_illeage;

	wire is_rvc;

	wire [63:0] pc;
	wire [63:0] imm;
	wire [5:0] shamt;
	wire rd0_runOut;

	wire fence_dispat;

	assign { 	rv64i_lui, rv64i_auipc, 
				rv64i_jal, rv64i_jalr, rv64i_beq, rv64i_bne, rv64i_blt, rv64i_bge, rv64i_bltu, rv64i_bgeu, 
				rv64i_lb, rv64i_lh, rv64i_lw, rv64i_ld, rv64i_lbu, rv64i_lhu, rv64i_lwu,
				rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd,
				rv64i_addi, rv64i_addiw, rv64i_slti, rv64i_sltiu, rv64i_xori, rv64i_ori, rv64i_andi, rv64i_slli, rv64i_slliw, rv64i_srli, rv64i_srliw, rv64i_srai, rv64i_sraiw,
				rv64i_add, rv64i_addw, rv64i_sub, rv64i_subw, rv64i_sll, rv64i_sllw, rv64i_slt, rv64i_sltu, rv64i_xor, rv64i_srl, rv64i_srlw, rv64i_sra, rv64i_sraw, rv64i_or, rv64i_and,
				rv64i_fence, rv64zi_fence_i,
				rv64csr_rw, rv64csr_rs, rv64csr_rc, rv64csr_rwi, rv64csr_rsi, rv64csr_rci,
				privil_ecall, privil_ebreak, privil_mret,
				rv64m_mul, rv64m_mulh, rv64m_mullhsu, rv64m_mulhu, rv64m_div, rv64m_divu, rv64m_rem, rv64m_remu, rv64m_mulw, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw,
				privil_accessFault, privil_illeage,
				is_rvc,
				pc, imm, shamt, rd0_raw, rs1_raw, rs2_raw
			} = decode_microInstr_pop;


	wire isBranch = rv64i_beq | rv64i_bne | rv64i_blt | rv64i_bge | rv64i_bltu | rv64i_bgeu;
	wire isSu = rv64i_sb | rv64i_sh | rv64i_sw | rv64i_sd;
	wire isLu = rv64i_lb | rv64i_lh | rv64i_lw | rv64i_ld | rv64i_lbu | rv64i_lhu | rv64i_lwu;
	wire isFence = rv64i_fence;
	wire isCsr = rv64csr_rw | rv64csr_rs | rv64csr_rc | rv64csr_rwi | rv64csr_rsi | rv64csr_rci;


	assign dispat_info = {pc, rd0_reName, isBranch, isLu, isSu, isFence, isCsr, privil_ecall, privil_ebreak, privil_mret, privil_accessFault, privil_illeage};




	wire privileged = privil_ecall | privil_ebreak | privil_mret | privil_accessFault | privil_illeage;

	assign reOrder_fifo_push = alu_buffer_push
								| bru_fifo_push
								| lsu_fifo_push
								| csr_fifo_push
								| mul_fifo_push
								| (privileged & dispat_valid)
								;

	assign instrFifo_pop = reOrder_fifo_push;



	assign alu_buffer_push = ( rv64i_lui | rv64i_auipc 
								| rv64i_addi | rv64i_addiw | rv64i_add | rv64i_addw | rv64i_sub | rv64i_subw 

								| rv64i_slti | rv64i_sltiu | rv64i_slt | rv64i_sltu |
								| rv64i_xori | rv64i_ori | rv64i_andi | rv64i_xor | rv64i_or | rv64i_and |
								
								| rv64i_slli | rv64i_slliw | rv64i_sll | rv64i_sllw |
								| rv64i_srli | rv64i_srliw | rv64i_srl | rv64i_srlw |
								| rv64i_srai | rv64i_sraiw | rv64i_sra | rv64i_sraw	) 
							& dispat_valid & (~alu_buffer_full);

	assign alu_dispat_info = { 	
				rv64i_lui, rv64i_auipc,
				rv64i_addi, rv64i_addiw, rv64i_add, rv64i_addw, rv64i_sub, rv64i_subw,

				rv64i_slti, rv64i_sltiu, rv64i_slt, rv64i_sltu,
				rv64i_xori, rv64i_ori, rv64i_andi, rv64i_xor, rv64i_or, rv64i_and,
				
				rv64i_slli, rv64i_slliw, rv64i_sll, rv64i_sllw,
				rv64i_srli, rv64i_srliw, rv64i_srl, rv64i_srlw,
				rv64i_srai, rv64i_sraiw, rv64i_sra, rv64i_sraw, 
				
				pc, shamt, imm,

				rd0_reName,
				rs1_reName,
				rs2_reName
			};





	assign bru_fifo_push = ( rv64i_jal | rv64i_jalr | rv64i_beq | rv64i_bne | rv64i_blt | rv64i_bge | rv64i_bltu | rv64i_bgeu) & dispat_valid & (~bru_fifo_full);
	assign bru_dispat_info = {
								rv64i_jal, rv64i_jalr, rv64i_beq, rv64i_bne, rv64i_blt, rv64i_bge, rv64i_bltu, rv64i_bgeu,
								is_rvc,
								pc, imm, 
								rd0_reName, rs1_reName, rs2_reName
							};

	assign csr_fifo_push = ( rv64csr_rw | rv64csr_rs | rv64csr_rc | rv64csr_rwi | rv64csr_rsi | rv64csr_rci ) & dispat_valid & (~csr_fifo_full);
	assign csr_dispat_info = {
								rv64csr_rw, rv64csr_rs, rv64csr_rc, rv64csr_rwi, rv64csr_rsi, rv64csr_rci,
								pc, imm[11:0], rd0_reName, rs1_reName
							};



	assign lsu_fifo_push = ( rv64i_lb | rv64i_lh | rv64i_lw | rv64i_ld | rv64i_lbu | rv64i_lhu | rv64i_lwu | rv64i_sb | rv64i_sh | rv64i_sw | rv64i_sd | rv64zi_fence_i | rv64i_fence) & dispat_valid & (~lsu_fifo_full);
	assign lsu_dispat_info = {
								rv64i_lb, rv64i_lh, rv64i_lw, rv64i_ld, rv64i_lbu, rv64i_lhu, rv64i_lwu,
								rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd,
								rv64zi_fence_i, rv64i_fence,
								imm,
								rd0_reName,
								rs1_reName,
								rs2_reName
							};

	
	assign mul_fifo_push = (rv64m_mul | rv64m_mulh | rv64m_mullhsu | rv64m_mulhu | rv64m_div | rv64m_divu | rv64m_rem | rv64m_remu | rv64m_mulw | rv64m_divw | rv64m_divuw | rv64_remw | rv64m_remuw) & dispat_valid & (~mul_fifo_full);
	assign mul_dispat_info = {
								rv64m_mul,
								rv64m_mulh,
								rv64m_mullhsu,
								rv64m_mulhu,
								rv64m_div,
								rv64m_divu,
								rv64m_rem,
								rv64m_remu,
								rv64m_mulw,
								rv64m_divw,
								rv64m_divuw,
								rv64_remw,
								rv64m_remuw,

								rd0_reName,
								rs1_reName,
								rs2_reName
							};







	wire rd0_raw_valid = reOrder_fifo_push;



rename i_rename(

	.rnAct_X_dnxt(rnAct_X_dnxt),
	.rnAct_X_qout(rnAct_X_qout),	

	.rnBufU_rename_set(rnBufU_rename_set),
	.rnBufU_qout(rnBufU_qout),

	.rs1_raw(rs1_raw),
	.rs1_reName(rs1_reName),

	.rs2_raw(rs2_raw),
	.rs2_reName(rs2_reName),
	
	.rd0_raw_valid(rd0_raw_valid),
	.rd0_raw(rd0_raw),
	.rd0_reName(rd0_reName),
	.rd0_runOut(rd0_runOut)

);




endmodule







