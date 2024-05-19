// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module IfStage (

		input clock,

		input [31:0] pc,

		input id_shouldJumpOrBranch,	// BRANCH
		input [31:0] id_jumpOrBranchPc,

		output [31:0] pc_4,

		output [31:0] instruction,

		output [31:0] nextPc
	);

	assign pc_4 = pc + 4;

	InstructionMemory instructionMemory (
		.clka(~clock),
		.addra(pc[9:2]),
		.douta(instruction[31:0])
	);

	assign nextPc = id_shouldJumpOrBranch ? id_jumpOrBranchPc : pc_4;
endmodule
