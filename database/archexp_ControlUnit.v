// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "Constants.vh"

module ControlUnit (

		input [31:0] instruction,

		output isJumpIndex,	// JUMP
		output [25:0] jumpIndex,	// address
		output isJumpRegister,	// JR, but not JALR yet
		input isRegisterRsRtEqual,	// RSRTEQU
		output shouldJumpOrBranch,	// BRANCH
		output isJumpAndLink,	// JAL

		output shouldSignElseZeroExtendImmediate,	// SEXT

		output [3:0] aluOperation,	// ALUC
		output shouldAluUseShiftAmountElseRegisterRsOrPc_4,	// SHIFT
		output shouldAluUseImmeidateElseRegisterRtOrZero,	// ALUIMM

		output shouldWriteRegister,	// WREG
		output shouldWriteToRegisterRtElseRd,	// REGRT
		output shouldWriteMemoryElseAluOutputToRegister,	// M2REG

		output shouldWriteMemory,	// WMEM

		input ex_shouldWriteRegister,
		input [4:0] ex_registerWriteAddress,
		input ex_shouldWriteMemoryElseAluOutputToRegister,
		input mem_shouldWriteRegister,
		input [4:0] mem_registerWriteAddress,
		input mem_shouldWriteMemoryElseAluOutputToRegister,
		output shouldStall,	// WPCIR
		output shouldForwardRegisterRsWithExStageAluOutput,
		output shouldForwardRegisterRsWithMemStageAluOutput,
		output shouldForwardRegisterRsWithMemStageMemoryData,
		output shouldForwardRegisterRtWithExStageAluOutput,
		output shouldForwardRegisterRtWithMemStageAluOutput,
		output shouldForwardRegisterRtWithMemStageMemoryData
	);

	wire [5:0] code = instruction[31:26];
	wire [5:0] function_ = instruction[5:0];

	assign isJumpIndex = code == `CODE_J || code == `CODE_JAL;
	assign jumpIndex = instruction[25:0];
	// TODO: JALR
	assign isJumpAndLink = code == `CODE_JAL;
	wire isRType = code == `CODE_R_TYPE;
	// TODO: JALR
	assign isJumpRegister = isRType && function_ == `FUNCTION_JR;
	wire isBeq = code == `CODE_BEQ;
	wire isBranch = isBeq || code == `CODE_BNE;
	wire shouldBranch = isBranch && (isBeq == isRegisterRsRtEqual);
	assign shouldJumpOrBranch = isJumpIndex || isJumpRegister || shouldBranch;

	assign shouldSignElseZeroExtendImmediate =
			code == `CODE_ADDI
			|| code == `CODE_ADDIU
			|| code == `CODE_LW
			|| code == `CODE_SW
			|| code == `CODE_BEQ
			|| code == `CODE_BNE
			|| code == `CODE_SLTI;
	assign aluOperation =
			isJumpAndLink ? `ALU_ADD	// pc_4 + 0
			: isRType ? (
				function_ == `FUNCTION_ADD ? `ALU_ADD
				: function_ == `FUNCTION_ADDU ? `ALU_ADDU
				: function_ == `FUNCTION_SUB ? `ALU_SUB
				: function_ == `FUNCTION_SUBU ? `ALU_SUBU
				: function_ == `FUNCTION_AND ? `ALU_AND
				: function_ == `FUNCTION_OR ? `ALU_OR
				: function_ == `FUNCTION_XOR ? `ALU_XOR
				: function_ == `FUNCTION_NOR ? `ALU_NOR
				: function_ == `FUNCTION_SLT ? `ALU_SUB
				: function_ == `FUNCTION_SLTU ? `ALU_SUBU
				: function_ == `FUNCTION_SLL ? `ALU_SLL
				: function_ == `FUNCTION_SRL ? `ALU_SRL
				: function_ == `FUNCTION_SRA ? `ALU_SRA
				: function_ == `FUNCTION_SLLV ? `ALU_SLL
				: function_ == `FUNCTION_SRLV ? `ALU_SRL
				: function_ == `FUNCTION_SRAV ? `ALU_SRA
				: `ALU_NONE
			)
			: code == `CODE_ADDI ? `ALU_ADD
			: code == `CODE_ADDIU ? `ALU_ADDU
			: code == `CODE_ANDI ? `ALU_AND
			: code == `CODE_ORI ? `ALU_OR
			: code == `CODE_XORI ? `ALU_XOR
			: code == `CODE_LUI ? `ALU_SLL	// HIGHLIGHT
			: code == `CODE_LW ? `ALU_ADD
			: code == `CODE_SW ? `ALU_ADD
			: code == `CODE_BEQ ? `ALU_SUB
			: code == `CODE_BNE ? `ALU_SUB
			: code == `CODE_SLTI ? `ALU_SUB
			: code == `CODE_SLTIU ? `ALU_SUBU
			: `ALU_NONE;
	assign shouldAluUseShiftAmountElseRegisterRsOrPc_4 =
			!isJumpAndLink	// pc_4
			&& (isRType && (
				function_ == `FUNCTION_SLL
				|| function_ == `FUNCTION_SRL
				|| function_ == `FUNCTION_SRA
			));
	assign shouldAluUseImmeidateElseRegisterRtOrZero =
			!isJumpAndLink	// 0
			&& (
				code == `CODE_ADDI
				|| code == `CODE_ADDIU
				|| code == `CODE_ANDI
				|| code == `CODE_ORI
				|| code == `CODE_XORI
				|| code == `CODE_LUI	// TODO: Correct?
				|| code == `CODE_LW
				|| code == `CODE_SW
				|| code == `CODE_SLTI
				|| code == `CODE_SLTIU
			);

	assign shouldWriteToRegisterRtElseRd =
			code == `CODE_ADDI
			|| code == `CODE_ADDIU
			|| code == `CODE_ANDI
			|| code == `CODE_ORI
			|| code == `CODE_XORI
			|| code == `CODE_LUI
			|| code == `CODE_LW
			|| code == `CODE_SLTI
			|| code == `CODE_SLTIU;
	assign shouldWriteRegister =
			(isRType && (
				function_ == `FUNCTION_ADD
				|| function_ == `FUNCTION_ADDU
				|| function_ == `FUNCTION_SUB
				|| function_ == `FUNCTION_SUBU
				|| function_ == `FUNCTION_AND
				|| function_ == `FUNCTION_OR
				|| function_ == `FUNCTION_XOR
				|| function_ == `FUNCTION_NOR
				|| function_ == `FUNCTION_SLT
				|| function_ == `FUNCTION_SLTU
				|| function_ == `FUNCTION_SLL
				|| function_ == `FUNCTION_SRL
				|| function_ == `FUNCTION_SRA
				|| function_ == `FUNCTION_SLLV
				|| function_ == `FUNCTION_SRLV
				|| function_ == `FUNCTION_SRAV
			))
			|| shouldWriteToRegisterRtElseRd
			|| isJumpAndLink;
	assign shouldWriteMemoryElseAluOutputToRegister = code == `CODE_LW;

	assign shouldWriteMemory = code == `CODE_SW;

	wire [4:0] rs = instruction[25:21];
	wire [4:0] rt = instruction[20:16];
	wire willExStageWriteRegisterRs = ex_shouldWriteRegister && ex_registerWriteAddress == rs;
	wire willExStageWriteRegisterRt = ex_shouldWriteRegister && ex_registerWriteAddress == rt;
	wire willMemStageWriteRegisterRs = mem_shouldWriteRegister && mem_registerWriteAddress == rs;
	wire willMemStageWriteRegisterRt = mem_shouldWriteRegister && mem_registerWriteAddress == rt;
	assign shouldStall = (willExStageWriteRegisterRs || willExStageWriteRegisterRt) && ex_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRsWithExStageAluOutput = willExStageWriteRegisterRs && !ex_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRsWithMemStageAluOutput = willMemStageWriteRegisterRs && !mem_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRsWithMemStageMemoryData = willMemStageWriteRegisterRs && mem_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRtWithExStageAluOutput = willExStageWriteRegisterRt && !ex_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRtWithMemStageAluOutput = willMemStageWriteRegisterRt && !mem_shouldWriteMemoryElseAluOutputToRegister;
	assign shouldForwardRegisterRtWithMemStageMemoryData = willMemStageWriteRegisterRt && mem_shouldWriteMemoryElseAluOutputToRegister;
endmodule
