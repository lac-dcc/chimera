// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module ExStage (

		input [31:0] shiftAmount,
		input [31:0] immediate,

		input [3:0] aluOperation,	// EALUC
		input shouldAluUseShiftAmountElseRegisterRsOrPc_4,	// ESHIFT
		input shouldAluUseImmeidateElseRegisterRtOrZero,	// EALUIMM

		input [31:0] registerRsOrPc_4,
		input [31:0] registerRtOrZero,

		output [31:0] aluOutput,

		output [31:0] debug_aluInputA,
		output [31:0] debug_aluInputB
	);

	wire [31:0] aluInputA = shouldAluUseShiftAmountElseRegisterRsOrPc_4 ? shiftAmount : registerRsOrPc_4;
	wire [31:0] aluInputB = shouldAluUseImmeidateElseRegisterRtOrZero ? immediate : registerRtOrZero;
	Alu alu (
		.inputA(aluInputA[31:0]),
		.inputB(aluInputB[31:0]),
		.operation(aluOperation[3:0]),
		.output_(aluOutput[31:0])
	);

	assign debug_aluInputA = aluInputA;
	assign debug_aluInputB = aluInputB;
endmodule
