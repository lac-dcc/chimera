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

module reg_decoder (
	output reg [23:0] str,
	input [4:0] r
);
	always @ (*) begin
		case (r)
			0 : str = " x0";
			1 : str = " ra";
			2 : str = " s0";
			3 : str = " s1";
			4 : str = " s2";
			5 : str = " s3";
			6 : str = " s4";
			7 : str = " s5";
			8 : str = " s6";
			9 : str = " s7";
			10: str = " s8";
			11: str = " s9";
			12: str = "s10";
			13: str = "s11";
			14: str = " sp";
			15: str = " tp";
			16: str = " v0";
			17: str = " v1";
			18: str = " a0";
			19: str = " a1";
			20: str = " a2";
			21: str = " a3";
			22: str = " a4";
			23: str = " a5";
			24: str = " a6";
			25: str = " a7";
			26: str = " a8";
			27: str = " a9";
			28: str = "a10";
			29: str = "a11";
			30: str = "a12";
			31: str = "a13";
			default: str = "???";
		endcase
	end
endmodule

module pcreg_decoder (
	output reg [63:0] str,
	input [4:0] r
);
	always @ (*) begin
		case (r)
			0 : str = "  status";
			1 : str = "     epc";
			2 : str = "badvaddr";
			3 : str = "    evec";
			4 : str = "   count";
			5 : str = " compare";
			6 : str = "   cause";
			7 : str = "    ptbr";
			12: str = "      k0";
			13: str = "      k1";
			30: str = "  tohost";
			31: str = "fromhost";
			default: str = "???";
		endcase
	end
endmodule

module imm_decoder (
	output [47:0] str,
	input [11:0] imm12
);
	wire [11:0] imm = imm12[11] ? -$signed(imm12) : imm12;

	wire [3:0] d0 = imm[3:0];
	wire [3:0] d1 = imm[7:4];
	wire [3:0] d2 = imm[11:8];

	wire [7:0] d0_s = d0 <= 9 ? "0" + d0 : "A" + d0 - 10;
	wire [7:0] d1_s = d1 <= 9 ? "0" + d1 : "A" + d1 - 10;
	wire [7:0] d2_s = d2 <= 9 ? "0" + d2 : "A" + d2 - 10;

	assign str = {imm12[11] ? "-" : " ", "0x", d2_s, d1_s, d0_s}; 

endmodule

module lui_decoder (
	output [55:0] str,
	input [19:0] imm
);

	wire [3:0] d0 = imm[3:0];
	wire [3:0] d1 = imm[7:4];
	wire [3:0] d2 = imm[11:8];
	wire [3:0] d3 = imm[15:12];
	wire [3:0] d4 = imm[19:16];

	wire [7:0] d0_s = d0 <= 9 ? "0" + d0 : "A" + d0 - 10;
	wire [7:0] d1_s = d1 <= 9 ? "0" + d1 : "A" + d1 - 10;
	wire [7:0] d2_s = d2 <= 9 ? "0" + d2 : "A" + d2 - 10;
	wire [7:0] d3_s = d3 <= 9 ? "0" + d3 : "A" + d3 - 10;
	wire [7:0] d4_s = d4 <= 9 ? "0" + d4 : "A" + d4 - 10;

	assign str = {"0x", d4_s, d3_s, d2_s, d1_s, d0_s}; 

endmodule

module addr_decoder (
	output [79:0] str,
	input [31:0] addr
);

	wire [3:0] d0 = addr[3:0];
	wire [3:0] d1 = addr[7:4];
	wire [3:0] d2 = addr[11:8];
	wire [3:0] d3 = addr[15:12];
	wire [3:0] d4 = addr[19:16];
	wire [3:0] d5 = addr[23:20];
	wire [3:0] d6 = addr[27:24];
	wire [3:0] d7 = addr[31:28];

	wire [7:0] d0_s = d0 <= 9 ? "0" + d0 : "A" + d0 - 10;
	wire [7:0] d1_s = d1 <= 9 ? "0" + d1 : "A" + d1 - 10;
	wire [7:0] d2_s = d2 <= 9 ? "0" + d2 : "A" + d2 - 10;
	wire [7:0] d3_s = d3 <= 9 ? "0" + d3 : "A" + d3 - 10;
	wire [7:0] d4_s = d4 <= 9 ? "0" + d4 : "A" + d4 - 10;
	wire [7:0] d5_s = d5 <= 9 ? "0" + d5 : "A" + d5 - 10;
	wire [7:0] d6_s = d6 <= 9 ? "0" + d6 : "A" + d6 - 10;
	wire [7:0] d7_s = d7 <= 9 ? "0" + d7 : "A" + d7 - 10;

	assign str = {"0x", d7_s, d6_s, d5_s, d4_s, d3_s, d2_s, d1_s, d0_s}; 

endmodule

module inst_decoder (
	output reg [(`STR_LEN * 8) - 1:0] str,
	input [31:0] jump_target,
	input [31:0] branch_target,
	input [31:0] inst
);

	wire [6:0] opcode = inst[6:0];
	wire [9:7] funct3 = inst[9:7];
	wire [11:0] imm12 = inst[21:10];
	wire [19:0] imm20 = inst[26:7];
	wire [11:0] split_imm12 = {inst[31:27], inst[16:10]};
	wire [4:0] wd = inst[31:27];
	reg [(8 * 8) - 1:0] op_s;
	reg [1:0] type;

	wire [23:0] wd_s;
	wire [23:0] rs1_s;
	wire [23:0] rs2_s;
	wire [63:0] pcr_s;

	wire [47:0] imm12_s;
	wire [47:0] split_imm12_s;
	wire [55:0] imm20_s;
	wire [79:0] addr_s;
	wire [79:0] branch_addr_s;

	reg_decoder r1(wd_s, wd);
	reg_decoder r2(rs1_s, inst[26:22]);
	reg_decoder r3(rs2_s, inst[21:17]);
	pcreg_decoder r4(pcr_s, inst[26:22]);

	imm_decoder id(imm12_s, imm12);
	lui_decoder ld(imm20_s, imm20);
	imm_decoder sid(split_imm12_s, split_imm12);
	addr_decoder ad(addr_s, jump_target);
	addr_decoder bd(branch_addr_s, branch_target);

	always @ (*) begin
		case (opcode)
			`OPCODE_OP:
				str[(`STR_LEN - 8) * 8 - 1:0] = 
					{" ", wd_s, ",", rs1_s, ",", rs2_s};

			`OPCODE_OP_IMM: begin
				if (inst != 32'h00000013) 
					str[(`STR_LEN - 8) * 8 - 1:0] = 
						{" ", wd_s, ",", rs1_s, ",", imm12_s};
				else
					str[(`STR_LEN - 8) * 8 - 1:0] = "";
			end

			`OPCODE_LUI:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", wd_s, ",", imm20_s};

			`OPCODE_J, `OPCODE_JAL:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", addr_s};

			`OPCODE_JALR:
				if (inst != 32'h004000eb)
					str[(`STR_LEN - 8) * 8 - 1:0] =
						{" ", wd_s, ",", rs1_s, ",", addr_s};
				else
					str[(`STR_LEN - 8) * 8 - 1:0] = "";

			`OPCODE_BRANCH:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", rs1_s, ",", rs2_s, ",", branch_addr_s};

			`OPCODE_LOAD:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", wd_s, ",", imm12_s, "(", rs1_s, ")"};

			`OPCODE_STORE:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", rs2_s, ",", split_imm12_s, "(", rs1_s, ")"};

			`OPCODE_PCR:
				str[(`STR_LEN - 8) * 8 - 1:0] =
					{" ", wd_s, ",", rs2_s, ",", pcr_s};

			default:
				str[(`STR_LEN - 8) * 8 - 1:0] = "";
		endcase
	end

	always @ (*) begin
		case (opcode)
			`OPCODE_OP:
				if (inst[10]) begin
					case (funct3)
						`F3_MUL:    op_s = "mul     ";
						`F3_MULH:   op_s = "mulh    ";
						`F3_MULHSU: op_s = "mulhsu  ";
						`F3_MULHU:  op_s = "mulhu   ";
						`F3_DIV:    op_s = "div     ";
						`F3_DIVU:   op_s = "divu    ";
						`F3_REM:    op_s = "rem     ";
						`F3_REMU:   op_s = "remu    ";
						default:    op_s = "???     ";
					endcase
				end else begin
					case (funct3)
						`F3_ADD:  op_s = inst[16] ? "sub     " : "add     ";
						`F3_SLL:  op_s = "sll     ";
						`F3_SLT:  op_s = "slt     ";
						`F3_SLTU: op_s = "sltu    ";
						`F3_XOR:  op_s = "xor     ";
						`F3_SR:   op_s = inst[16] ? "sra     " : "srl     ";
						`F3_OR:   op_s = "or      ";
						`F3_AND:  op_s = "and     ";
						default: op_s = "???     ";
					endcase
				end

			`OPCODE_OP_IMM:
				case (funct3)
					`F3_ADD:  op_s = inst == 32'h00000013 ? "nop     " : "addi    ";
					`F3_SLL:  op_s = "slli    ";
					`F3_SLT:  op_s = "slti    ";
					`F3_SLTU: op_s = "sltiu   ";
					`F3_XOR:  op_s = "xori    ";
					`F3_SR:   op_s = inst[16] ? "srai    " : "srli    ";
					`F3_OR:   op_s = "ori     ";
					`F3_AND:  op_s = "andi    ";
					default: op_s = "???     ";
				endcase

			`OPCODE_LUI:
				op_s = "lui     ";

			`OPCODE_J:
				op_s = "j       ";

			`OPCODE_JAL:
				op_s = "jal     ";

			`OPCODE_JALR:
				if (inst == 32'h004000eb)
					op_s = "ret     ";
				else
					op_s = wd == 5'd0 ? "jr      " : "jalr    "; 

			`OPCODE_LOAD:
				case (funct3) 
					`F3_LB:  op_s = "lb      ";
					`F3_LH:  op_s = "lh      ";
					`F3_LW:  op_s = "lw      ";
					`F3_LBU: op_s = "lbu     ";
					`F3_LHU: op_s = "lhu     ";
					default: op_s = "???     ";
				endcase

			`OPCODE_STORE:
				case (funct3)
					`F3_SB:  op_s = "sb      ";
					`F3_SH:  op_s = "sh      ";
					`F3_SW:  op_s = "sw      ";
					default: op_s = "???     ";
				endcase

			`OPCODE_BRANCH:
				case (funct3)
					`F3_BEQ:  op_s = "beq     ";
					`F3_BNE:  op_s = "bne     ";
					`F3_BLT:  op_s = "blt     ";
					`F3_BGE:  op_s = "bge     ";
					`F3_BLTU: op_s = "bltu    ";
					`F3_BGEU: op_s = "bgeu    ";
					default:  op_s = "???     ";
				endcase

			`OPCODE_PCR:
				case (funct3)
					`F3_CLEARPCR: op_s = "clearpcr";
					`F3_SETPCR:   op_s = "setpcr  ";
					`F3_MFPCR:    op_s = "mfpcr   ";
					`F3_MTPCR:    op_s = "mtpcr   ";
					default:      op_s = "???     ";
				endcase

			default:
				op_s = "???";
		endcase

		str[(`STR_LEN * 8) - 1:((`STR_LEN - 8) * 8)] = op_s;
	end


endmodule

