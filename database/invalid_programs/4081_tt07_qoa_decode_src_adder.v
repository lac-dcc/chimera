// This program was cloned from: https://github.com/28add11/tt07_qoa_decode
// License: Apache License 2.0

/*
* Copyright (c) 2024 Nicholas Alan West
* SPDX-License-Identifier: Apache-2.0
*/

/*
Made by Nicholas West (28add11)

The adder unit, 32 bits wide
*/

/*
* The full adder
*/
module fullAdder (
		input wire a,
		input wire b,
		input wire cin,
		output wire sum,
		output wire cout
	);

	wire abSum;

	// Sum block
	assign abSum = a ^ b;
	assign sum = abSum ^ cin;

	// Carry block
	assign cout = (a & b) | (abSum & cin);

endmodule

/*
* 32 bit carry-ripple adder
* purely combinational
*/
module adder (
		input wire signed [31:0] term1,
		input wire signed [31:0] term2,
		output wire signed [31:0] sum
	);

	// For generation of full adders
	genvar i;
	wire [31:0] carry;

	fullAdder fa(.a(input1[0]), .b(input2[0]), .cin(1'b0), .sum(sum[0]), .cout(carry[0]));
	// For loop to generate the other 31 full adders
	generate
		for (i = 1; i <= 31; i = i + 1) begin
			fullAdder fa(.a(input1[i]), .b(input2[i]), .cin(carry[i - 1]), .sum(sum[i]), .cout(carry[i]));
		end
	endgenerate

endmodule