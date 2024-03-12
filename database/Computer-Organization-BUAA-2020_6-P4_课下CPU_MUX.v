`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:55:55 11/17/2020 
// Design Name: 
// Module Name:    MUX 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Mux_2_32(		// 2 ports in, 32-bits
	input [31:0] in0,
	input [31:0] in1,
	input sel,
	output [31:0] out
    );
	assign out = (sel == 0)? in0:in1;
endmodule

module Mux_4_5(
	input [4:0] in0,
	input [4:0] in1,
	input [4:0] in2,
	input [4:0] in3,
	input [1:0] sel,
	output [4:0] out
	);
	assign out =	(sel == 2'b00)? in0:
					(sel == 2'b01)? in1:
					(sel == 2'b10)? in2:
					in3;
endmodule 

module Mux_4_32(
	input [31:0] in0,
	input [31:0] in1,
	input [31:0] in2,
	input [31:0] in3,
	input [1:0] sel,
	output [31:0] out
	);
	assign out =	(sel == 2'b00)? in0:
					(sel == 2'b01)? in1:
					(sel == 2'b10)? in2:
					in3;
endmodule 