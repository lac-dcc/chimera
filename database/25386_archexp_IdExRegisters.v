// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module IdExRegisters (

		input clock,
		input reset,

		input id_shouldStall,

		input [31:0] id_instruction,

		input [31:0] id_shiftAmount,
		input [31:0] id_immediate,

		input [31:0] id_registerRsOrPc_4,
		input [31:0] id_registerRtOrZero,

		input [3:0] id_aluOperation,
		input id_shouldAluUseShiftAmountElseRegisterRsOrPc_4,
		input id_shouldAluUseImmeidateElseRegisterRtOrZero,

		input id_shouldWriteRegister,
		input [4:0] id_registerWriteAddress,
		input id_shouldWriteMemoryElseAluOutputToRegister,

		input id_shouldWriteMemory,

		output reg [31:0] ex_instruction = 0,

		output reg [31:0] ex_shiftAmount = 0,
		output reg [31:0] ex_immediate = 0,

		output reg [31:0] ex_registerRsOrPc_4 = 0,
		output reg [31:0] ex_registerRtOrZero = 0,

		output reg [3:0] ex_aluOperation = 0,
		output reg ex_shouldAluUseShiftAmountElseRegisterRsOrPc_4 = 0,
		output reg ex_shouldAluUseImmeidateElseRegisterRtOrZero = 0,

		output reg ex_shouldWriteRegister = 0,
		output reg [4:0] ex_registerWriteAddress = 0,
		output reg ex_shouldWriteMemoryElseAluOutputToRegister = 0,

		output reg ex_shouldWriteMemory = 0
	);

	always @(posedge clock) begin

		if (reset || id_shouldStall) begin

			ex_instruction <= 0;

			ex_shiftAmount <= 0;
			ex_immediate <= 0;

			ex_registerRsOrPc_4 <= 0;
			ex_registerRtOrZero <= 0;

			ex_aluOperation <= 0;
			ex_shouldAluUseShiftAmountElseRegisterRsOrPc_4 <= 0;
			ex_shouldAluUseImmeidateElseRegisterRtOrZero <= 0;

			ex_shouldWriteRegister <= 0;
			ex_registerWriteAddress <= 0;
			ex_shouldWriteMemoryElseAluOutputToRegister <= 0;

			ex_shouldWriteMemory <= 0;

		end else begin

			ex_instruction <= id_instruction;

			ex_shiftAmount <= id_shiftAmount;
			ex_immediate <= id_immediate;

			ex_registerRsOrPc_4 <= id_registerRsOrPc_4;
			ex_registerRtOrZero <= id_registerRtOrZero;

			ex_aluOperation <= id_aluOperation;
			ex_shouldAluUseShiftAmountElseRegisterRsOrPc_4 <= id_shouldAluUseShiftAmountElseRegisterRsOrPc_4;
			ex_shouldAluUseImmeidateElseRegisterRtOrZero <= id_shouldAluUseImmeidateElseRegisterRtOrZero;

			ex_shouldWriteRegister <= id_shouldWriteRegister;
			ex_registerWriteAddress <= id_registerWriteAddress;
			ex_shouldWriteMemoryElseAluOutputToRegister <= id_shouldWriteMemoryElseAluOutputToRegister;

			ex_shouldWriteMemory <= id_shouldWriteMemory;
		end
	end
endmodule
