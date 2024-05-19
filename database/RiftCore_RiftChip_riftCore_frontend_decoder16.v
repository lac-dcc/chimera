// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: decoder16
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-08-18 17:02:25
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-22 10:50:44
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


module decoder16 
(

	input [15:0] instr,
	input [63:0] pc,
	input is_rvc,

	output [`DECODE_INFO_DW-1:0] decode_microInstr
);


	wire [15:0] instr_16 = instr;


	wire [1:0] opcode = instr_16[1:0];
	wire [2:0] funct3 = instr_16[15:13];

	wire opcode_00 = opcode == 2'b00;
	wire opcode_01 = opcode == 2'b01;	
	wire opcode_10 = opcode == 2'b10;

	wire funct3_000 = funct3 == 3'b000;
	wire funct3_001 = funct3 == 3'b001;
	wire funct3_010 = funct3 == 3'b010;
	wire funct3_011 = funct3 == 3'b011;
	wire funct3_100 = funct3 == 3'b100;
	wire funct3_101 = funct3 == 3'b101;
	wire funct3_110 = funct3 == 3'b110;
	wire funct3_111 = funct3 == 3'b111;

	wire [4:0] rd0;
	wire [4:0] rs1;
	wire [4:0] rs2;
	wire [63:0] imm;



wire ADDI4SPN = opcode_00 & funct3_000 & (| instr_16[12:5]);
wire LW = opcode_00 & funct3_010;
wire LD       = opcode_00 & funct3_011;
wire SW       = opcode_00 & funct3_110;
wire SD       = opcode_00 & funct3_111;

wire NOP = opcode_01 & funct3_000 & (&(~instr_16[12:2]));
wire ADDI = opcode_01 & funct3_000 & (|instr_16[11:7]);
wire ADDIW = opcode_01 & funct3_001 & (|instr_16[11:7]);

wire LI = opcode_01 & funct3_010 & (|instr_16[11:7]);

wire ADDI16SP = opcode_01 & funct3_011 & (instr_16[11:7] == 5'd2) & (|{instr_16[12], instr_16[6:2]});
wire LUI = opcode_01 & funct3_011 & (instr_16[11:7] != 5'd2 & instr_16[12:2] != 5'd0);

wire SRLI = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b00) & ( | {instr_16[12],instr_16[6:2]} );
// wire SRLI64 = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b00) & ( &(~{instr_16[12,instr_16[6:2]]}) );
wire SRAI = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b01) & ( | {instr_16[12],instr_16[6:2]} );
// wire SRAI64 = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b01) & ( &(~{instr_16[12,instr_16[6:2]]}) );
wire ANDI = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b10);
wire SUB = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & ~instr_16[12] & (instr_16[6:5] == 2'b00);
wire XOR = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & ~instr_16[12] & (instr_16[6:5] == 2'b01);
wire OR = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & ~instr_16[12] & (instr_16[6:5] == 2'b10);
wire AND = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & ~instr_16[12] & (instr_16[6:5] == 2'b11);
wire SUBW = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & instr_16[12] & (instr_16[6:5] == 2'b00);
wire ADDW = opcode_01 & funct3_100 & (instr_16[11:10] == 2'b11) & instr_16[12] & (instr_16[6:5] == 2'b01);

wire J = opcode_01 & funct3_101;

wire BEQZ       = opcode_01 & funct3_110;
wire BNEZ       = opcode_01 & funct3_111;

wire SLLI = opcode_10 & funct3_000 & (|instr_16[11:7]) & ( | {instr_16[12],instr_16[6:2]} );
// wire SLLI64 = opcode_10 & funct3_000 & (|instr_16[11:7]) & ( & (~{instr_16[12,instr_16[6:2]]}) );

wire LWSP = opcode_10 & funct3_010 & (|instr_16[11:7]);
wire LDSP = opcode_10 & funct3_011 & (|instr_16[11:7]);

wire JR = opcode_10 & funct3_100 & ~instr_16[12] & (instr_16[6:2] == 0);
wire MV = opcode_10 & funct3_100 & ~instr_16[12] & (| instr_16[6:2]);
wire EBREAK = opcode_10 & funct3_100 & (instr_16[12:2] == 11'b10000000000);
wire JALR = opcode_10 & funct3_100 & instr_16[12] & (|instr_16[11:7]) & (&(~instr_16[6:2]));
wire ADD = opcode_10 & funct3_100 & instr_16[12] & (|instr_16[11:7]) & (| instr_16[6:2]);

wire SWSP = opcode_10 & funct3_110;
wire SDSP = opcode_10 & funct3_111;

assign rd0 = ({5{SW | SD | NOP | J | BEQZ | BNEZ | JR | EBREAK | SWSP | SDSP}} & 5'd0)
			|
			({5{JALR}} & 5'd1)
			|
			({5{ADDI16SP}} & 5'd2)
			|
			({5{ADDI4SPN | LW | LD}} & {2'b01,instr_16[4:2]} )
			|
			( {5{ADDI|ADDIW|LI|LUI|SLLI|LWSP|LDSP|MV|ADD}} & {instr_16[11:7]} )
			|
			({5{SRLI | SRAI | ANDI|SUB| XOR | OR | AND | SUBW | ADDW}} & {2'b01, instr_16[9:7]});


assign rs1 = ( {5{NOP|LI|LUI|MV}} & 5'd0 )
			|
			({5{ADDI4SPN | ADDI16SP | LWSP | LDSP | SWSP | SDSP}} & 5'd2)
			|
			({5{LW | LD | SW | SD | SRLI | SRAI | ANDI | SUB| XOR | OR | AND | SUBW | ADDW | BEQZ | BNEZ}} & {2'b01, instr_16[9:7]})
			|
			({5{ADDI | ADDIW | SLLI | JR | JALR | ADD}} & instr_16[11:7]);

assign rs2 = ( {5{SW | SD | SUB | XOR | OR | AND | SUBW | ADDW  }} &  {2'b01,instr_16[4:2]} )
			|
			({5{MV | ADD | SWSP | SDSP}}& instr_16[6:2]);


assign imm = ({64{NOP}} & 64'd0)
			|
			({64{ADDI4SPN}} & {54'b0, instr_16[10:7],instr_16[12:11],instr_16[5],instr_16[6],2'b0})
			|
			({64{LW | SW}} & {57'b0, instr_16[5],instr_16[12:10], instr_16[6],2'b0})
			|
			({64{LD | SD}} & {56'b0, instr_16[6:5],instr_16[12:10], 3'b0})
			|
			({64{ADDI|ADDIW|LI|ANDI}} & { {58{instr_16[12]}}, instr_16[12],instr_16[6:2]})
			|
			({64{LUI}} & {{46{instr_16[12]}},instr_16[12],instr_16[6:2],12'b0})
			|
			({64{ADDI16SP}} & {{54{instr_16[12]}}, instr_16[12], instr_16[4:3], instr_16[5],instr_16[2],instr_16[6], 4'b0})
			|
			({64{BEQZ|BNEZ}} & {{55{instr_16[12]}}, instr_16[12], instr_16[6:5], instr_16[2],instr_16[11:10], instr_16[4:3], 1'b0})
			|
			({64{LWSP}} & {56'b0, instr_16[3:2], instr_16[12], instr_16[6:4], 2'b0 })
			|
			({64{LDSP}} & {55'b0, instr_16[4:2], instr_16[12], instr_16[6:5], 3'b0})
			|
			({64{SWSP}} & {56'b0, instr_16[8:7], instr_16[12:9], 2'b0})
			|
			({64{SDSP}} & {55'b0, instr_16[9:7], instr_16[12:10], 3'b0})
			|
			({64{J}} & {{52{instr_16[12]}}, instr_16[12], instr_16[8], instr_16[10:9], instr_16[6], instr_16[7], instr_16[2], instr_16[11], instr_16[5:3], 1'b0});



wire [5:0] shamt = ( {6{SRLI | SRAI | SLLI}} & {instr_16[12], instr_16[6:2]});



	wire rv64i_lui 		= LUI;
	wire rv64i_auipc 	= 1'b0;
	wire rv64i_jal 		= J;
	wire rv64i_jalr 	= JR | JALR;

	wire rv64i_beq 		= BEQZ;
	wire rv64i_bne 		= BNEZ;
	wire rv64i_blt 		= 1'b0;
	wire rv64i_bge 		= 1'b0;
	wire rv64i_bltu 	= 1'b0;
	wire rv64i_bgeu 	= 1'b0;

	wire rv64i_lb 		= 1'b0;
	wire rv64i_lh 		= 1'b0;
	wire rv64i_lw 		= LW | LWSP;
	wire rv64i_lbu 		= 1'b0;
	wire rv64i_lhu 		= 1'b0;
	wire rv64i_lwu 		= 1'b0;
	wire rv64i_ld 		= LD | LDSP;

	wire rv64i_sb 		= 1'b0;
	wire rv64i_sh 		= 1'b0;
	wire rv64i_sw 		= SW | SWSP;
	wire rv64i_sd 		= SD | SDSP;

	wire rv64i_addi 	= ADDI4SPN | NOP | ADDI | LI | ADDI16SP;
	wire rv64i_addiw 	= ADDIW;
	wire rv64i_slti 	= 1'b0;
	wire rv64i_sltiu 	= 1'b0;
	wire rv64i_xori 	= 1'b0;
	wire rv64i_ori 		= 1'b0;
	wire rv64i_andi 	= ANDI;
	wire rv64i_slli 	= SLLI;
	wire rv64i_slliw 	= 1'b0;
	wire rv64i_srli 	= SRLI;
	wire rv64i_srliw 	= 1'b0;
	wire rv64i_srai 	= SRAI;
	wire rv64i_sraiw 	= 1'b0;

	wire rv64i_add 		= MV | ADD;
	wire rv64i_addw 	= ADDW;
	wire rv64i_sub 		= SUB;
	wire rv64i_subw 	= SUBW;
	wire rv64i_sll 		= 1'b0;
	wire rv64i_sllw 	= 1'b0;
	wire rv64i_slt 		= 1'b0;
	wire rv64i_sltu 	= 1'b0;
	wire rv64i_xor 		= XOR;
	wire rv64i_srl 		= 1'b0;
	wire rv64i_srlw 	= 1'b0;
	wire rv64i_sra 		= 1'b0;
	wire rv64i_sraw 	= 1'b0;
	wire rv64i_or 		= OR;
	wire rv64i_and 		= AND;

	wire rv64i_fence 	= 1'b0;
	wire rv64zi_fence_i = 1'b0;


	wire rv64csr_rw 	= 1'b0;
	wire rv64csr_rs 	= 1'b0;
	wire rv64csr_rc 	= 1'b0;
	wire rv64csr_rwi 	= 1'b0;
	wire rv64csr_rsi 	= 1'b0;
	wire rv64csr_rci 	= 1'b0;

	wire rv64i_ecall 	= 1'b0;
	wire rv64i_ebreak 	= EBREAK;


	wire privil_mret 	= 1'b0;

	wire rv64m_mul = 1'b0;
	wire rv64m_mulh = 1'b0;
	wire rv64m_mullhsu = 1'b0;
	wire rv64m_mulhu = 1'b0;
	wire rv64m_div = 1'b0;
	wire rv64m_divu = 1'b0;
	wire rv64m_rem = 1'b0;
	wire rv64m_remu = 1'b0;
	wire rv64m_mulw = 1'b0;
	wire rv64m_divw = 1'b0;
	wire rv64m_divuw = 1'b0;
	wire rv64_remw = 1'b0;
	wire rv64m_remuw = 1'b0;

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


















