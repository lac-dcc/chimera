// This program was cloned from: https://github.com/zhanghai/archexp
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module BooleanTextConverter (
		input boolean,
		output [5 * 8 - 1 : 0] text
	);

	assign text = boolean ? "True " : "False";
endmodule
