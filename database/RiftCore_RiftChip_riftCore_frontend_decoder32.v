// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: decoder32
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-08-18 17:02:25
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 19:14:34
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


module decoder32 
(
	input [31:0] instr,
	input [63:0] pc,
	input is_rvc,

	output [`DECODE_INFO_DW-1:0] decode_microInstr
);


	wire [31:0] instr_32 = instr;


	wire [6:0] opcode 	= instr_32[6:0];


	wire [4:0] rd0 	= (rv64i_beq | rv64i_bne | rv64i_blt | rv64i_bge | rv64i_bltu | rv64i_bgeu | 
						rv64i_sb | rv64i_sh | rv64i_sw | rv64i_sd |
						rv64i_fence | rv64zi_fence_i |						
						rv64i_ecall | rv64i_ebreak)
						? 5'd0
						: instr_32[11:7];



	wire [2:0] funct3 	= instr_32[14:12];
	wire [4:0] rs1 		= instr_32[19:15];
	wire [4:0] rs2 		= instr_32[24:20];
	wire [6:0] funct7 	= instr_32[31:25];

	wire [63:0] iType_imm = {{52{instr_32[31]}},instr_32[31:20]};
	wire [63:0] sType_imm = {{52{instr_32[31]}},instr_32[31:25],instr_32[11:7]};
	wire [63:0] bType_imm = {{52{instr_32[31]}},instr_32[7],instr_32[30:25],instr_32[11:8],1'b0};
	wire [63:0] uType_imm = {{32{instr_32[31]}},instr_32[31:12],12'b0};
	wire [63:0] jType_imm = {{44{instr_32[31]}},instr_32[19:12],instr_32[20],instr_32[30:21],1'b0};







	wire opcode_xxxxx00 = (opcode[1:0] == 2'b00);
	wire opcode_xxxxx01 = (opcode[1:0] == 2'b01);
	wire opcode_xxxxx10 = (opcode[1:0] == 2'b10);
	wire opcode_xxxxx11 = (opcode[1:0] == 2'b11);

	wire opcode_xx000xx = (opcode[4:2] == 3'b000);
	wire opcode_xx001xx = (opcode[4:2] == 3'b001);
	wire opcode_xx010xx = (opcode[4:2] == 3'b010);
	wire opcode_xx011xx = (opcode[4:2] == 3'b011);
	wire opcode_xx100xx = (opcode[4:2] == 3'b100);
	wire opcode_xx101xx = (opcode[4:2] == 3'b101);
	wire opcode_xx110xx = (opcode[4:2] == 3'b110);
	wire opcode_xx111xx = (opcode[4:2] == 3'b111);

	wire opcode_00xxxxx = (opcode[6:5] == 2'b00);
	wire opcode_01xxxxx = (opcode[6:5] == 2'b01);
	wire opcode_10xxxxx = (opcode[6:5] == 2'b10);
	wire opcode_11xxxxx = (opcode[6:5] == 2'b11);

	// wire instr32 = (~opcode_xx111xx) & opcode_xxxxx11;

	wire op_load 		= opcode_00xxxxx & opcode_xx000xx & opcode_xxxxx11;
	// wire op_load_fp 	= opcode_00xxxxx & opcode_xx001xx & opcode_xxxxx11;
	// wire op_custom_0 	= opcode_00xxxxx & opcode_xx010xx & opcode_xxxxx11;
	wire op_misc_mem 	= opcode_00xxxxx & opcode_xx011xx & opcode_xxxxx11;
	wire op_op_imm 		= opcode_00xxxxx & opcode_xx100xx & opcode_xxxxx11;
	wire op_auipc 		= opcode_00xxxxx & opcode_xx101xx & opcode_xxxxx11;
	wire op_op_imm32 	= opcode_00xxxxx & opcode_xx110xx & opcode_xxxxx11;

	wire op_store 		= opcode_01xxxxx & opcode_xx000xx & opcode_xxxxx11;
	// wire op_store_fp 	= opcode_01xxxxx & opcode_xx001xx & opcode_xxxxx11;
	// wire op_custom_1 	= opcode_01xxxxx & opcode_xx010xx & opcode_xxxxx11;
	// wire op_amo		 	= opcode_01xxxxx & opcode_xx011xx & opcode_xxxxx11;
	wire op_op 			= opcode_01xxxxx & opcode_xx100xx & opcode_xxxxx11;
	wire op_lui 		= opcode_01xxxxx & opcode_xx101xx & opcode_xxxxx11;
	wire op_op_32 		= opcode_01xxxxx & opcode_xx110xx & opcode_xxxxx11;

	wire op_madd 		= opcode_10xxxxx & opcode_xx000xx & opcode_xxxxx11;
	wire op_msub	 	= opcode_10xxxxx & opcode_xx001xx & opcode_xxxxx11;
	wire op_nmsub	 	= opcode_10xxxxx & opcode_xx010xx & opcode_xxxxx11;
	wire op_NMADD		= opcode_10xxxxx & opcode_xx011xx & opcode_xxxxx11;
	// wire op_op_fp 		= opcode_10xxxxx & opcode_xx100xx & opcode_xxxxx11;
	// wire op_reserved 	= opcode_10xxxxx & opcode_xx101xx & opcode_xxxxx11;
	// wire op_custom_2	= opcode_10xxxxx & opcode_xx110xx & opcode_xxxxx11;

	wire op_branch 		= opcode_11xxxxx & opcode_xx000xx & opcode_xxxxx11;
	wire op_jalr	 	= opcode_11xxxxx & opcode_xx001xx & opcode_xxxxx11;
	// wire op_reserved 	= opcode_11xxxxx & opcode_xx010xx & opcode_xxxxx11;
	wire op_jal			= opcode_11xxxxx & opcode_xx011xx & opcode_xxxxx11;
	wire op_system 		= opcode_11xxxxx & opcode_xx100xx & opcode_xxxxx11;
	// wire op_reserved 	= opcode_11xxxxx & opcode_xx101xx & opcode_xxxxx11;
	// wire op_custom_3	= opcode_11xxxxx & opcode_xx110xx & opcode_xxxxx11;



	wire funct3_000 = (funct3 == 3'b000);
	wire funct3_001 = (funct3 == 3'b001);
	wire funct3_010 = (funct3 == 3'b010);
	wire funct3_011 = (funct3 == 3'b011);
	wire funct3_100 = (funct3 == 3'b100);
	wire funct3_101 = (funct3 == 3'b101);
	wire funct3_110 = (funct3 == 3'b110);
	wire funct3_111 = (funct3 == 3'b111);

	wire funct7_0000000 = ( funct7 == 7'b0000000);
	wire funct7_0100000 = ( funct7 == 7'b0100000);
	wire funct7_0000001 = ( funct7 == 7'b0000001);
	wire funct7_0000101 = ( funct7 == 7'b0000101);
	wire funct7_0001001 = ( funct7 == 7'b0001001);
	wire funct7_0001101 = ( funct7 == 7'b0001101);
	wire funct7_0010101 = ( funct7 == 7'b0010101);
	wire funct7_0100001 = ( funct7 == 7'b0100001);
	wire funct7_0010001 = ( funct7 == 7'b0010001);
	wire funct7_0101101 = ( funct7 == 7'b0101101);
	wire funct7_1111111 = ( funct7 == 7'b1111111);
	wire funct7_0000100 = ( funct7 == 7'b0000100); 
	wire funct7_0001000 = ( funct7 == 7'b0001000); 
	wire funct7_0001100 = ( funct7 == 7'b0001100); 
	wire funct7_0101100 = ( funct7 == 7'b0101100); 
	wire funct7_0010000 = ( funct7 == 7'b0010000); 
	wire funct7_0010100 = ( funct7 == 7'b0010100); 
	wire funct7_1100000 = ( funct7 == 7'b1100000); 
	wire funct7_1110000 = ( funct7 == 7'b1110000); 
	wire funct7_1010000 = ( funct7 == 7'b1010000); 
	wire funct7_1101000 = ( funct7 == 7'b1101000); 
	wire funct7_1111000 = ( funct7 == 7'b1111000); 
	wire funct7_1010001 = ( funct7 == 7'b1010001);  
	wire funct7_1110001 = ( funct7 == 7'b1110001);  
	wire funct7_1100001 = ( funct7 == 7'b1100001);  
	wire funct7_1101001 = ( funct7 == 7'b1101001);  





	wire rv64i_lui 		= op_lui;
	wire rv64i_auipc 	= op_auipc;
	wire rv64i_jal 		= op_jal;
	wire rv64i_jalr 	= op_jalr & funct3_000;

	wire rv64i_beq 		= op_branch & funct3_000;
	wire rv64i_bne 		= op_branch & funct3_001;
	wire rv64i_blt 		= op_branch & funct3_100;
	wire rv64i_bge 		= op_branch & funct3_101;	
	wire rv64i_bltu 	= op_branch & funct3_110;		
	wire rv64i_bgeu 	= op_branch & funct3_111;

	wire rv64i_lb 		= op_load & funct3_000;
	wire rv64i_lh 		= op_load & funct3_001;
	wire rv64i_lw 		= op_load & funct3_010;
	wire rv64i_lbu 		= op_load & funct3_100;
	wire rv64i_lhu 		= op_load & funct3_101;
	wire rv64i_lwu 		= op_load & funct3_110;
	wire rv64i_ld 		= op_load & funct3_011;

	wire rv64i_sb 		= op_store & funct3_000;
	wire rv64i_sh 		= op_store & funct3_001;
	wire rv64i_sw 		= op_store & funct3_010;
	wire rv64i_sd 		= op_store & funct3_011;

	wire rv64i_addi 	= op_op_imm 	& funct3_000;
	wire rv64i_addiw 	= op_op_imm32 	& funct3_000;
	wire rv64i_slti 	= op_op_imm 	& funct3_010;
	wire rv64i_sltiu 	= op_op_imm 	& funct3_011;
	wire rv64i_xori 	= op_op_imm 	& funct3_100;
	wire rv64i_ori 		= op_op_imm 	& funct3_110;
	wire rv64i_andi 	= op_op_imm 	& funct3_111;
	wire rv64i_slli 	= op_op_imm 	& funct3_001 & ( funct7[6:1] == 6'b000000 );
	wire rv64i_slliw 	= op_op_imm32 	& funct3_001 & funct7_0000000;
	wire rv64i_srli 	= op_op_imm 	& funct3_101 & ( funct7[6:1] == 6'b000000 );
	wire rv64i_srliw 	= op_op_imm32 	& funct3_101 & funct7_0000000;
	wire rv64i_srai 	= op_op_imm 	& funct3_101 & ( funct7[6:1] == 6'b010000 );
	wire rv64i_sraiw 	= op_op_imm32 	& funct3_101 & funct7_0100000;

	wire rv64i_add 		= op_op 	& funct3_000 & funct7_0000000;
	wire rv64i_addw 	= op_op_32 	& funct3_000 & funct7_0000000;
	wire rv64i_sub 		= op_op 	& funct3_000 & funct7_0100000;
	wire rv64i_subw 	= op_op_32 	& funct3_000 & funct7_0100000;
	wire rv64i_sll 		= op_op 	& funct3_001 & funct7_0000000;
	wire rv64i_sllw 	= op_op_32 	& funct3_001 & funct7_0000000;
	wire rv64i_slt 		= op_op 	& funct3_010 & funct7_0000000;
	wire rv64i_sltu 	= op_op 	& funct3_011 & funct7_0000000;
	wire rv64i_xor 		= op_op 	& funct3_100 & funct7_0000000;
	wire rv64i_srl 		= op_op 	& funct3_101 & funct7_0000000;
	wire rv64i_srlw 	= op_op_32 	& funct3_101 & funct7_0000000;
	wire rv64i_sra 		= op_op 	& funct3_101 & funct7_0100000;
	wire rv64i_sraw 	= op_op_32 	& funct3_101 & funct7_0100000;
	wire rv64i_or 		= op_op 	& funct3_110 & funct7_0000000;
	wire rv64i_and 		= op_op 	& funct3_111 & funct7_0000000;

	wire rv64i_fence 	= op_misc_mem & funct3_000;
	wire rv64zi_fence_i = op_misc_mem & funct3_001;	


	wire rv64csr_rw 	= op_system & funct3_001;
	wire rv64csr_rs 	= op_system & funct3_010;
	wire rv64csr_rc 	= op_system & funct3_011;
	wire rv64csr_rwi 	= op_system & funct3_101;
	wire rv64csr_rsi 	= op_system & funct3_110;
	wire rv64csr_rci 	= op_system & funct3_111;

	wire rv64i_ecall 	= op_system & funct3_000 & (instr_32[31:20] == 12'b000000000000);
	wire rv64i_ebreak 	= op_system & funct3_000 & (instr_32[31:20] == 12'b000000000001);


	wire privil_mret 	= (instr_32 == 32'b0011000_00010_00000_000_00000_1110011);


	wire rv64m_mul =  funct7_0000001 & funct3_000 & op_op;
	wire rv64m_mulh = funct7_0000001 & funct3_001 & op_op;
	wire rv64m_mullhsu = funct7_0000001 & funct3_010 & op_op;
	wire rv64m_mulhu = funct7_0000001 & funct3_011 & op_op;
	wire rv64m_div =  funct7_0000001 & funct3_100 & op_op;
	wire rv64m_divu =  funct7_0000001 & funct3_101 & op_op;
	wire rv64m_rem =  funct7_0000001 & funct3_110 & op_op;
	wire rv64m_remu = funct7_0000001 & funct3_111 & op_op;

	wire rv64m_mulw = funct7_0000001 & funct3_000 & op_op_32;
	wire rv64m_divw = funct7_0000001 & funct3_100 & op_op_32;
	wire rv64m_divuw = funct7_0000001 & funct3_101 & op_op_32;
	wire rv64_remw = funct7_0000001 & funct3_110 & op_op_32;
	wire rv64m_remuw = funct7_0000001 & funct3_111 & op_op_32;















	wire rType = rv64i_add | rv64i_addw | rv64i_sub | rv64i_subw | rv64i_sll | rv64i_sllw | rv64i_slt | rv64i_sltu 
					| rv64i_xor | rv64i_srl | rv64i_srlw | rv64i_sra | rv64i_sraw | rv64i_or | rv64i_and;
	wire iType = rv64i_jalr 
					| rv64i_lb | rv64i_lh | rv64i_lw | rv64i_lbu | rv64i_lhu | rv64i_lwu | rv64i_ld
					| rv64i_addi | rv64i_addiw | rv64i_slti | rv64i_sltiu | rv64i_xori | rv64i_ori | rv64i_andi
					| rv64i_fence | rv64zi_fence_i
					| rv64csr_rw | rv64csr_rs | rv64csr_rc | rv64csr_rwi | rv64csr_rsi | rv64csr_rci;
	wire sType = rv64i_sb | rv64i_sh | rv64i_sw | rv64i_sd;
	wire bType = rv64i_beq | rv64i_bne | rv64i_blt | rv64i_bge | rv64i_bltu | rv64i_bgeu;
	wire uType = rv64i_lui | op_auipc;
	wire jType = op_jal;

	wire [63:0] imm = 64'b0
					| {64{iType}} & iType_imm
					| {64{sType}} & sType_imm
					| {64{bType}} & bType_imm
					| {64{uType}} & uType_imm
					| {64{jType}} & jType_imm;



	wire [5:0] shamt = instr_32[25:20];

	wire privil_accessFault = 1'b0;
	wire privil_illeage = ~rv64i_lui & ~rv64i_auipc & ~rv64i_jal & ~rv64i_jalr & ~rv64i_beq & ~rv64i_bne & ~rv64i_blt & ~rv64i_bge & ~rv64i_bltu & ~rv64i_bgeu & ~rv64i_lb & ~rv64i_lh & ~rv64i_lw & ~rv64i_lbu & ~rv64i_lhu & ~rv64i_lwu & ~rv64i_ld & ~rv64i_sb & ~rv64i_sh & ~rv64i_sw & ~rv64i_sd & ~rv64i_addi & ~rv64i_addiw & ~rv64i_slti & ~rv64i_sltiu & ~rv64i_xori & ~rv64i_ori & ~rv64i_andi & ~rv64i_slli & ~rv64i_slliw & ~rv64i_srli & ~rv64i_srliw & ~rv64i_srai & ~rv64i_sraiw & ~rv64i_add & ~rv64i_addw & ~rv64i_sub & ~rv64i_subw & ~rv64i_sll & ~rv64i_sllw & ~rv64i_slt & ~rv64i_sltu & ~rv64i_xor & ~rv64i_srl & ~rv64i_srlw & ~rv64i_sra & ~rv64i_sraw & ~rv64i_or & ~rv64i_and & ~rv64i_fence & ~rv64zi_fence_i & ~rv64csr_rw & ~rv64csr_rs & ~rv64csr_rc & ~rv64csr_rwi & ~rv64csr_rsi & ~rv64csr_rci & ~rv64i_ecall & ~rv64i_ebreak & ~privil_mret & ~rv64m_mul & ~rv64m_mulh & ~rv64m_mullhsu & ~rv64m_mulhu & ~rv64m_div & ~rv64m_divu & ~rv64m_rem & ~rv64m_remu & ~rv64m_mulw & ~rv64m_divw & ~rv64m_divuw & ~rv64_remw & ~rv64m_remuw;

 

	assign decode_microInstr = 
		{ rv64i_lui, rv64i_auipc, rv64i_jal, rv64i_jalr,
		rv64i_beq, rv64i_bne, rv64i_blt, rv64i_bge, rv64i_bltu, rv64i_bgeu, 
		rv64i_lb, rv64i_lh, rv64i_lw, rv64i_ld, rv64i_lbu, rv64i_lhu, rv64i_lwu,
		rv64i_sb, rv64i_sh, rv64i_sw, rv64i_sd,
		rv64i_addi, rv64i_addiw, rv64i_slti, rv64i_sltiu, rv64i_xori, rv64i_ori, rv64i_andi, rv64i_slli, rv64i_slliw, rv64i_srli, rv64i_srliw, rv64i_srai, rv64i_sraiw,
		rv64i_add, rv64i_addw, rv64i_sub, rv64i_subw, rv64i_sll, rv64i_sllw, rv64i_slt, rv64i_sltu, rv64i_xor, rv64i_srl, rv64i_srlw, rv64i_sra, rv64i_sraw, rv64i_or, rv64i_and,
		rv64i_fence, rv64zi_fence_i,
		rv64csr_rw, rv64csr_rs, rv64csr_rc, rv64csr_rwi, rv64csr_rsi, rv64csr_rci,
		rv64i_ecall, rv64i_ebreak, privil_mret,
		rv64m_mul, rv64m_mulh, rv64m_mullhsu, rv64m_mulhu, rv64m_div, rv64m_divu, rv64m_rem, rv64m_remu, rv64m_mulw, rv64m_divw, rv64m_divuw, rv64_remw, rv64m_remuw,
		privil_accessFault, privil_illeage,
		is_rvc,
		pc, imm, shamt, rd0,rs1,rs2
		};







endmodule


















