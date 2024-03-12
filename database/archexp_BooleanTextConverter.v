`timescale 1ns / 1ps

module BooleanTextConverter (
		input boolean,
		output [5 * 8 - 1 : 0] text
	);

	assign text = boolean ? "True " : "False";
endmodule
