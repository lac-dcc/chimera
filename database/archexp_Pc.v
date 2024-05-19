// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Pc (

		input clock,
		input reset,

		input id_shouldStall,

		input [31:0] nextPc,
		output reg [31:0] pc = 0
	);

	always @(posedge clock) begin
		if (reset) begin
			pc <= 0;
		end else if (id_shouldStall) begin
			pc <= pc;
		end else begin
			pc <= nextPc;
		end
	end
endmodule
