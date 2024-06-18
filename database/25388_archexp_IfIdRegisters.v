// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module IfIdRegisters (

		input clock,
		input reset,

		input id_shouldStall,

		input [31:0] if_pc_4,

		input [31:0] if_instruction,

		output reg [31:0] id_pc_4 = 0,

		output reg [31:0] id_instruction = 0
	);

	always @(posedge clock) begin

		if (reset) begin

			id_pc_4 <= 0;

			id_instruction <= 0;

		end else if (id_shouldStall) begin

			id_pc_4 <= id_pc_4;

			id_instruction <= id_instruction;

		end else begin

			id_pc_4 <= if_pc_4;

			id_instruction <= if_instruction;
		end
	end
endmodule
